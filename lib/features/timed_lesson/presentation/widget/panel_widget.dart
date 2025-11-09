import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../base/timer/widget/timer_widget.dart';

// Providers
final visibleProvider = StateProvider<bool>((ref) => false);

class PanelWidget extends ConsumerStatefulWidget {
  const PanelWidget({
    super.key,
  });

  @override
  ConsumerState<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends ConsumerState<PanelWidget>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 6.0,
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.elasticIn,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!ref.read(visibleProvider)) {
        _startBounceAnimation();
      }
    });
  }

  void _startBounceAnimation() {
    _bounceController.forward().then((_) {
      _bounceController.reverse().then((_) {
        if (mounted && !ref.read(visibleProvider)) {
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) {
              _bounceController.forward().then((_) {
                _bounceController.reverse();
              });
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isVisible = ref.watch(visibleProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 900;

    ref.listen(visibleProvider, (previous, current) {
      if (previous == true && current == false && mounted) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) _startBounceAnimation();
        });
      }
    });

    // Calculate width
    double keyboardHeight;
    if (isDesktop) {
      keyboardHeight = 280;
    } else if (isTablet) {
      keyboardHeight = 240;
    } else {
      keyboardHeight = 220; // Fixed height for mobile
    }

    return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Keyboard
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              width: isVisible ? keyboardHeight : 0,
              alignment: Alignment.topLeft,
              child: isVisible ? const ExerciseTimePanel() : null,
            ),
            // Toggle handle
            AnimatedBuilder(
              animation: _bounceAnimation,
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(0, -_bounceAnimation.value),
                    child: GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        if (details.delta.dx > 5 && isVisible) {
                          ref.read(visibleProvider.notifier).state = false;
                        } else if (details.delta.dx < -5 && !isVisible) {
                          ref.read(visibleProvider.notifier).state = true;
                        }
                      },
                      onTap: () {
                        ref.read(visibleProvider.notifier).state = !isVisible;
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 250,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(13),
                              blurRadius: 4,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  isVisible
                                      ? Icons.keyboard_arrow_right
                                      : Icons.keyboard_arrow_left,
                                  size: 18,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(height: 8),
                                Icon(
                                  isVisible
                                      ? Icons.timelapse_outlined
                                      : Icons.timelapse,
                                  size: 18,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ],
        ));
  }
}
