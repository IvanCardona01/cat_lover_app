import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingView extends StatelessWidget {
  final String? message;
  final double? strokeWidth;

  const LoadingView({
    super.key,
    this.message,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Get.theme.colorScheme.primary,
            strokeWidth: strokeWidth ?? 3,
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Get.theme.textTheme.bodyLarge?.copyWith(
                color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
