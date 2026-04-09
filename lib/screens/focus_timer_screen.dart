import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class FocusTimerScreen extends StatefulWidget {
  const FocusTimerScreen({super.key});

  @override
  State<FocusTimerScreen> createState() => _FocusTimerScreenState();
}

class _FocusTimerScreenState extends State<FocusTimerScreen>
    with SingleTickerProviderStateMixin {
  static const int _workMinutes = 25;
  static const int _breakMinutes = 5;

  int _totalSeconds = _workMinutes * 60;
  int _remainingSeconds = _workMinutes * 60;
  bool _isRunning = false;
  bool _isBreak = false;
  int _sessionsCompleted = 0;
  Timer? _timer;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        _onTimerComplete();
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _isBreak = false;
      _totalSeconds = _workMinutes * 60;
      _remainingSeconds = _totalSeconds;
    });
  }

  void _onTimerComplete() {
    if (_isBreak) {
      // Break done → start new work session
      setState(() {
        _isBreak = false;
        _totalSeconds = _workMinutes * 60;
        _remainingSeconds = _totalSeconds;
        _isRunning = false;
      });
    } else {
      // Work done → go to break
      setState(() {
        _sessionsCompleted++;
        _isBreak = true;
        _totalSeconds = _breakMinutes * 60;
        _remainingSeconds = _totalSeconds;
        _isRunning = false;
      });
    }
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final progress = _totalSeconds > 0
        ? (_totalSeconds - _remainingSeconds) / _totalSeconds
        : 0.0;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                'Focus Timer',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const Spacer(flex: 1),

            // Timer circle
            ScaleTransition(
              scale: _isRunning ? _pulseAnimation : const AlwaysStoppedAnimation(1.0),
              child: SizedBox(
                width: 260,
                height: 260,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Glow bg
                    if (_isRunning)
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: (_isBreak
                                      ? AppColors.priorityLow
                                      : AppColors.accent)
                                  .withValues(alpha: 0.25),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    // Background ring
                    CustomPaint(
                      size: const Size(260, 260),
                      painter: _TimerRingPainter(
                        progress: 1.0,
                        color: (_isBreak
                                ? AppColors.priorityLow
                                : AppColors.accent)
                            .withValues(alpha: 0.12),
                        strokeWidth: 8,
                      ),
                    ),
                    // Progress ring
                    CustomPaint(
                      size: const Size(260, 260),
                      painter: _TimerRingPainter(
                        progress: progress,
                        color:
                            _isBreak ? AppColors.priorityLow : AppColors.accent,
                        strokeWidth: 8,
                      ),
                    ),
                    // Center text
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _isBreak ? 'BREAK' : 'FOCUS',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 3,
                            color: _isBreak
                                ? AppColors.priorityLow
                                : AppColors.accent,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatTime(_remainingSeconds),
                          style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.w200,
                            color: isDark
                                ? Colors.white
                                : AppColors.lightTextPrimary,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Reset
                _ControlButton(
                  icon: Icons.refresh,
                  onTap: _resetTimer,
                  isDark: isDark,
                ),
                const SizedBox(width: 24),
                // Play / Pause
                GestureDetector(
                  onTap: _isRunning ? _pauseTimer : _startTimer,
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: _isBreak
                            ? [AppColors.priorityLow, const Color(0xFF81C784)]
                            : [AppColors.accent, AppColors.accentLight],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: (_isBreak
                                  ? AppColors.priorityLow
                                  : AppColors.accent)
                              .withValues(alpha: 0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      _isRunning ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                // Skip
                _ControlButton(
                  icon: Icons.skip_next,
                  onTap: () {
                    _timer?.cancel();
                    _onTimerComplete();
                  },
                  isDark: isDark,
                ),
              ],
            ),

            const Spacer(flex: 1),

            // Sessions counter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GlassCard(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _SessionStat(
                      icon: Icons.local_fire_department,
                      label: 'Sessions',
                      value: '$_sessionsCompleted',
                      color: AppColors.priorityMedium,
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.black.withValues(alpha: 0.1),
                    ),
                    _SessionStat(
                      icon: Icons.timer_outlined,
                      label: 'Focus Time',
                      value: '${_sessionsCompleted * _workMinutes}m',
                      color: AppColors.accent,
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.black.withValues(alpha: 0.1),
                    ),
                    _SessionStat(
                      icon: Icons.emoji_events_outlined,
                      label: 'Goal',
                      value: '4',
                      color: AppColors.categoryPersonal,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() => _sessionsCompleted = 0);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.accent.withValues(alpha: 0.3),
                    ),
                    color: AppColors.accent.withValues(alpha: 0.1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.refresh_rounded,
                        size: 16,
                        color: AppColors.accent,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Reset Sessions',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isDark;

  const _ControlButton({
    required this.icon,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.05),
        ),
        child: Icon(
          icon,
          color: isDark ? Colors.white.withValues(alpha: 0.6) : Colors.black54,
          size: 24,
        ),
      ),
    );
  }
}

class _SessionStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _SessionStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: color,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _TimerRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _TimerRingPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = color;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _TimerRingPainter old) =>
      old.progress != progress || old.color != color;
}
