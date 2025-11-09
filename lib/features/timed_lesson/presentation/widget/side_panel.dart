import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'selection_widget.dart';
import 'handle_widget.dart';

final visibleProvider = StateProvider<bool>((ref) => false);

class SidePanel extends ConsumerWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(visibleProvider);
    final width = MediaQuery.of(context).size.width;

    final targetWidth = width >= 1100
        ? 320.0
        : (width >= 900 ? 280.0 : (width >= 600 ? 240.0 : 220.0));

    return SizedBox(
      // <-- gives tight height to children when parent is bounded
      height: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // <-- stretch vertically
        children: [
          Handle(
            isVisible: isVisible,
            onToggle: () =>
                ref.read(visibleProvider.notifier).state = !isVisible,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            width: isVisible ? targetWidth : 0,
            // DO NOT set height here; Row+stretch gives us tight height
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 8,
                  offset: const Offset(-2, 2),
                ),
              ],
              border: Border.all(
                color: Theme.of(context).dividerColor.withOpacity(.4),
              ),
            ),
            child: isVisible
                ? const SingleChildScrollView(
                    padding: EdgeInsets.all(8),
                    child: SelectionPanel(),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
