import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyView extends StatelessWidget {
  final String? title;
  final String? message;
  final String? buttonText;
  final VoidCallback? onRetry;
  final IconData? icon;
  final double? iconSize;

  const EmptyView({
    super.key,
    this.title,
    this.message,
    this.buttonText,
    this.onRetry,
    this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.pets_outlined,
              size: iconSize ?? 80,
              color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 24),
            if (title != null) ...[
              Text(
                title!,
                style: Get.theme.textTheme.headlineSmall?.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
            ],
            if (message != null) ...[
              Text(
                message!,
                style: Get.theme.textTheme.bodyMedium?.copyWith(
                  color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
            ],
            if (onRetry != null && buttonText != null)
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: Icon(
                  Icons.refresh,
                  color: Get.theme.colorScheme.onPrimary,
                ),
                label: Text(
                  buttonText!,
                  style: Get.theme.textTheme.bodyLarge?.copyWith(
                    color: Get.theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.theme.colorScheme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
