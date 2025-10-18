import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;
  final String? emoji;
  final VoidCallback onTap;

  const SettingButton({
    super.key,
    required this.title,
    required this.value,
    this.icon,
    this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (emoji != null)
                    Text(emoji!, style: const TextStyle(fontSize: 20))
                  else if (icon != null)
                    Icon(
                      icon,
                      size: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
