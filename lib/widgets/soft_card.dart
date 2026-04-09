import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SoftCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double borderRadius;
  final Color? color;
  final bool isPressed;

  const SoftCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.borderRadius = 16,
    this.color,
    this.isPressed = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor =
        color ?? (isDark ? AppColors.darkCard : AppColors.lightCard);
    final shadowDark =
        isDark ? AppColors.darkShadowDark : AppColors.lightShadowDark;
    final shadowLight =
        isDark ? AppColors.darkShadowLight : AppColors.lightShadowLight;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: margin ?? const EdgeInsets.symmetric(vertical: 6),
        padding: padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: isPressed
              ? [
                  BoxShadow(
                    color: shadowDark.withValues(alpha: 0.5),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: shadowLight.withValues(alpha: 0.3),
                    offset: const Offset(-2, -2),
                    blurRadius: 4,
                  ),
                ]
              : [
                  BoxShadow(
                    color: shadowDark.withValues(alpha: 0.4),
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                  ),
                  BoxShadow(
                    color: shadowLight.withValues(alpha: 0.2),
                    offset: const Offset(-4, -4),
                    blurRadius: 8,
                  ),
                ],
        ),
        child: child,
      ),
    );
  }
}
