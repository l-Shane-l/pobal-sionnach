import 'package:flutter/material.dart';

class Handle extends StatelessWidget {
  const Handle({required this.isVisible, required this.onToggle});
  final bool isVisible;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        width: 28,
        // DO NOT use height: double.infinity in a non-stretched context.
        // Here, Row crossAxisAlignment.stretch gives it tight height.
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(.4),
          ),
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isVisible
                      ? Icons.keyboard_double_arrow_right
                      : Icons.keyboard_double_arrow_left,
                  size: 18,
                  color: primary,
                ),
                const SizedBox(width: 4),
                Container(
                  width: 26,
                  height: 3,
                  decoration: BoxDecoration(
                    color: primary.withOpacity(.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
