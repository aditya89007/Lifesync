import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit_model.dart';
import '../providers/habit_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/soft_card.dart';

class EditHabitScreen extends StatefulWidget {
  final HabitModel habit;
  const EditHabitScreen({super.key, required this.habit});

  @override
  State<EditHabitScreen> createState() => _EditHabitScreenState();
}

class _EditHabitScreenState extends State<EditHabitScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late IconData _selectedIcon;
  late String _selectedFrequency;
  late Color _selectedColor;
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.habit.name);
    _selectedIcon = widget.habit.icon;
    _selectedFrequency = widget.habit.frequency;
    _selectedColor = widget.habit.color;
    _animController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Habit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline,
                color: AppColors.priorityHigh),
            onPressed: _confirmDelete,
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Live Preview
                Center(
                  child: SoftCard(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedColor.withValues(alpha: 0.15),
                            border: Border.all(
                              color: _selectedColor.withValues(alpha: 0.3),
                              width: 2,
                            ),
                          ),
                          child: Icon(_selectedIcon,
                              size: 36, color: _selectedColor),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _nameController.text.isEmpty
                              ? 'Your Habit'
                              : _nameController.text,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color:
                                    _selectedColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                _selectedFrequency.toUpperCase(),
                                style: TextStyle(
                                  color: _selectedColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.priorityMedium
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '🔥 ${widget.habit.currentStreak} streak',
                                style: const TextStyle(
                                  color: AppColors.priorityMedium,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Habit Name
                Text('Habit Name',
                    style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nameController,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                  decoration: const InputDecoration(
                    hintText: 'e.g., Drink Water, Exercise',
                    prefixIcon:
                        Icon(Icons.edit_outlined, color: AppColors.accent),
                  ),
                  onChanged: (_) => setState(() {}),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a habit name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Icon Selector
                Text('Choose Icon',
                    style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                SoftCard(
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.zero,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: HabitModel.availableIcons.length,
                    itemBuilder: (context, index) {
                      final icon = HabitModel.availableIcons[index];
                      final isSelected = _selectedIcon == icon;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedIcon = icon),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? _selectedColor.withValues(alpha: 0.2)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected
                                  ? _selectedColor
                                  : (isDark
                                      ? AppColors.darkDivider
                                      : AppColors.lightDivider),
                              width: isSelected ? 1.5 : 0.5,
                            ),
                          ),
                          child: Icon(icon,
                              size: 22,
                              color: isSelected
                                  ? _selectedColor
                                  : (isDark
                                      ? AppColors.darkTextTertiary
                                      : AppColors.lightTextTertiary)),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Frequency
                Text('Frequency',
                    style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                Row(
                  children: ['daily', 'weekly', 'custom'].map((freq) {
                    final isSelected = _selectedFrequency == freq;
                    return Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: freq != 'custom' ? 8 : 0),
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _selectedFrequency = freq),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.accent.withValues(alpha: 0.15)
                                  : (isDark
                                      ? AppColors.darkSurface
                                      : AppColors.lightCardLight),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.accent
                                    : (isDark
                                        ? AppColors.darkDivider
                                        : AppColors.lightDivider),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                freq[0].toUpperCase() + freq.substring(1),
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColors.accent
                                      : (isDark
                                          ? AppColors.darkTextSecondary
                                          : AppColors.lightTextSecondary),
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                // Color Picker
                Text('Color', style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                Row(
                  children: AppColors.habitColors.map((color) {
                    final isSelected = _selectedColor == color;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedColor = color),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                            border: isSelected
                                ? Border.all(color: Colors.white, width: 3)
                                : null,
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: color.withValues(alpha: 0.5),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          child: isSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 20)
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 32),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _saveHabit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.save_outlined, size: 22),
                        SizedBox(width: 8),
                        Text('Save Changes',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveHabit() {
    if (_formKey.currentState!.validate()) {
      final updatedHabit = widget.habit.copyWith(
        name: _nameController.text.trim(),
        icon: _selectedIcon,
        frequency: _selectedFrequency,
        color: _selectedColor,
      );
      context.read<HabitProvider>().updateHabit(updatedHabit);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Habit updated! ✅'),
          backgroundColor: _selectedColor,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Habit?'),
        content: Text(
            'This will delete "${widget.habit.name}" and all its streak data.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<HabitProvider>().deleteHabit(widget.habit.id);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Delete',
                style: TextStyle(color: AppColors.priorityHigh)),
          ),
        ],
      ),
    );
  }
}
