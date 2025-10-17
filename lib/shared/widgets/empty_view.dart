import 'package:flutter/material.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon ?? Icons.pets_outlined,
                      size: iconSize ?? 80,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
                    ),
                    const SizedBox(height: 24),
                    if (title != null) ...[
                      Text(
                        title!,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                    ],
                    if (message != null) ...[
                      Text(
                        message!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
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
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        label: Text(
                          buttonText!,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
