// lib/presentation/widgets/custom_keyboard_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Providers
final shiftStateProvider = StateProvider<bool>((ref) => false);
final keyboardVisibleProvider = StateProvider<bool>((ref) => true);
final fadaModeProvider = StateProvider<bool>((ref) => false);
final specialCharsModeProvider = StateProvider<bool>((ref) => false);
final pressedKeysProvider = StateProvider<Set<String>>((ref) => {});
final altHeldProvider = StateProvider<bool>((ref) => false);

// Key types
enum KeyType { letter, modifier, action, space, special }

// Keyboard constants following platform guidelines
class KeyboardConstants {
  // Minimum touch targets
  static const double minTouchTarget = 44.0; // iOS minimum
  static const double androidMinTarget = 48.0; // Android minimum

  // Key spacing
  static const double keySpacing = 3.0; // Minimal gap between keys
  static const double rowSpacing = 6.0; // Gap between rows

  // Key sizes for different devices
  static const double desktopKeyHeight = 52.0;
  static const double tabletKeyHeight = 48.0;
  static const double mobileKeyHeight = 46.0;

  // Font sizes
  static const double desktopFontSize = 20.0;
  static const double tabletFontSize = 18.0;
  static const double mobileFontSize = 16.0;

  // Keyboard padding
  static const double desktopPadding = 12.0;
  static const double tabletPadding = 8.0;
  static const double mobilePadding = 4.0;
}

class CustomKeyboardWidget extends ConsumerStatefulWidget {
  final Function(String) onLetterTap;
  final VoidCallback onBackspaceTap;
  final VoidCallback onShiftTap;

  const CustomKeyboardWidget({
    super.key,
    required this.onLetterTap,
    required this.onBackspaceTap,
    required this.onShiftTap,
  });

  @override
  ConsumerState<CustomKeyboardWidget> createState() =>
      _CustomKeyboardWidgetState();
}

class _CustomKeyboardWidgetState extends ConsumerState<CustomKeyboardWidget>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  final fadaMap = {
    'a': 'á',
    'A': 'Á',
    'e': 'é',
    'E': 'É',
    'i': 'í',
    'I': 'Í',
    'o': 'ó',
    'O': 'Ó',
    'u': 'ú',
    'U': 'Ú',
  };

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
      // Clear any lingering pressed key highlights after first frame
      ref.read(pressedKeysProvider.notifier).state = {};
      if (!ref.read(keyboardVisibleProvider)) {
        _startBounceAnimation();
      }
    });
  }

  void _startBounceAnimation() {
    _bounceController.forward().then((_) {
      _bounceController.reverse().then((_) {
        if (mounted && !ref.read(keyboardVisibleProvider)) {
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
    final isKeyboardVisible = ref.watch(keyboardVisibleProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 900;

    ref.listen(keyboardVisibleProvider, (previous, current) {
      // Clear any transient pressed key highlights whenever visibility toggles
      ref.read(pressedKeysProvider.notifier).state = {};

      if (previous == true && current == false && mounted) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) _startBounceAnimation();
        });
      }
    });

    // Calculate keyboard height
    double keyboardHeight;
    if (isDesktop) {
      keyboardHeight = 280;
    } else if (isTablet) {
      keyboardHeight = 240;
    } else {
      keyboardHeight = 220; // Fixed height for mobile
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Toggle handle
        AnimatedBuilder(
          animation: _bounceAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -_bounceAnimation.value),
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 5 && isKeyboardVisible) {
                    ref.read(keyboardVisibleProvider.notifier).state = false;
                  } else if (details.delta.dy < -5 && !isKeyboardVisible) {
                    ref.read(keyboardVisibleProvider.notifier).state = true;
                  }
                },
                onTap: () {
                  ref.read(keyboardVisibleProvider.notifier).state =
                      !isKeyboardVisible;
                },
                child: Container(
                  height: 32,
                  width: double.infinity,
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
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isKeyboardVisible
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          size: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          isKeyboardVisible
                              ? Icons.keyboard_hide
                              : Icons.keyboard,
                          size: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        if (isDesktop) ...[
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withAlpha(38),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(77),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              'Esc',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        // Keyboard
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          height: isKeyboardVisible ? keyboardHeight : 0,
          child: isKeyboardVisible
              ? _TypewriterKeyboard(
                  onLetterTap: widget.onLetterTap,
                  onBackspaceTap: widget.onBackspaceTap,
                  onShiftTap: widget.onShiftTap,
                  keyboardHeight: keyboardHeight,
                )
              : null,
        ),
      ],
    );
  }
}

class _TypewriterKeyboard extends ConsumerWidget {
  final Function(String) onLetterTap;
  final VoidCallback onBackspaceTap;
  final VoidCallback onShiftTap;
  final double keyboardHeight;

  const _TypewriterKeyboard({
    required this.onLetterTap,
    required this.onBackspaceTap,
    required this.onShiftTap,
    required this.keyboardHeight,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSpecialMode = ref.watch(specialCharsModeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final isTablet = screenWidth > 600;

    // Get appropriate padding
    double padding;
    if (isDesktop) {
      padding = KeyboardConstants.desktopPadding;
    } else if (isTablet) {
      padding = KeyboardConstants.tabletPadding;
    } else {
      padding = KeyboardConstants.mobilePadding;
    }

    Widget keyboard = Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: EdgeInsets.all(padding),
      child: isSpecialMode
          ? _buildSpecialLayout(context, ref)
          : _buildLetterLayout(context, ref),
    );

    if (isDesktop) {
      keyboard = Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          child: keyboard,
        ),
      );
    }

    return keyboard;
  }

  Widget _buildLetterLayout(BuildContext context, WidgetRef ref) {
    final isShiftEnabled = ref.watch(shiftStateProvider);
    final isFadaMode = ref.watch(fadaModeProvider);
    final isAltHeld = ref.watch(altHeldProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    final fadaMap = {
      'a': 'á',
      'A': 'Á',
      'e': 'é',
      'E': 'É',
      'i': 'í',
      'I': 'Í',
      'o': 'ó',
      'O': 'Ó',
      'u': 'ú',
      'U': 'Ú',
    };

    final rows = [
      ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
      ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
      ['z', 'x', 'c', 'v', 'b', 'n', 'm'],
    ];

    return Column(
      children: [
        // Three rows of letters
        for (int i = 0; i < rows.length; i++)
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: KeyboardConstants.rowSpacing),
              child: Row(
                children: [
                  // Add shift key on third row
                  if (i == 2)
                    _KeyboardKey(
                      display: '⇧',
                      value: 'SHIFT',
                      type: KeyType.modifier,
                      flex: 15, // 1.5x width
                      isActive: isShiftEnabled,
                      onTap: onShiftTap,
                    ),

                  // Spacer for second row (to center it)
                  if (i == 1) const Spacer(flex: 5),

                  // Letter keys
                  ...rows[i].map((letter) {
                    final char = isShiftEnabled ? letter.toUpperCase() : letter;
                    final hasFada = fadaMap.containsKey(char);
                    final displayChar = ((isFadaMode || isAltHeld) && hasFada)
                        ? fadaMap[char]!
                        : char;

                    return _KeyboardKey(
                      display: displayChar,
                      value: displayChar,
                      keyIdentifier: letter,
                      type: KeyType.letter,
                      hasFada: hasFada && (isFadaMode || isAltHeld),
                      onTap: () {
                        onLetterTap(displayChar);
                        if ((isFadaMode || isAltHeld) && hasFada) {
                          ref.read(fadaModeProvider.notifier).state = false;
                        }
                      },
                      onLongPress: hasFada
                          ? () {
                              final shift = ref.read(shiftStateProvider);
                              final vowel =
                                  shift ? letter.toUpperCase() : letter;
                              final accent = fadaMap[vowel] ?? displayChar;
                              onLetterTap(accent);
                            }
                          : null,
                    );
                  }),

                  // Spacer for second row
                  if (i == 1) const Spacer(flex: 5),

                  // Backspace on third row (disabled)
                  if (i == 2)
                    _KeyboardKey(
                      display: '⌫',
                      value: 'BACKSPACE',
                      keyIdentifier: 'BACKSPACE',
                      type: KeyType.action,
                      flex: 15,
                      onTap: () {}, // Disabled backspace functionality
                    ),
                ],
              ),
            ),
          ),

        // Bottom row with space bar
        Expanded(
          child: Row(
            children: [
              _KeyboardKey(
                display: isDesktop ? 'Fada (Alt)' : 'Fada',
                value: 'FADA',
                type: KeyType.modifier,
                flex: 15,
                isActive: isFadaMode || isAltHeld,
                onTap: () =>
                    ref.read(fadaModeProvider.notifier).state = !isFadaMode,
              ),
              _KeyboardKey(
                display: '',
                value: ' ',
                keyIdentifier: ' ',
                type: KeyType.space,
                flex: 40,
                onTap: () {
                  // Ignore spacebar presses - don't count as a try
                },
              ),
              _KeyboardKey(
                display: isDesktop ? '?123 (Tab)' : '?123',
                value: '?123',
                type: KeyType.modifier,
                flex: 15,
                onTap: () =>
                    ref.read(specialCharsModeProvider.notifier).state = true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialLayout(BuildContext context, WidgetRef ref) {
    final isFadaMode = ref.watch(fadaModeProvider);
    final isAltHeld = ref.watch(altHeldProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Column(
      children: [
        // Numbers row
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: KeyboardConstants.rowSpacing),
            child: Row(
              children: [
                for (final num in '1234567890'.split(''))
                  _KeyboardKey(
                    display: num,
                    value: num,
                    keyIdentifier: num,
                    type: KeyType.special,
                    onTap: () => onLetterTap(num),
                  ),
              ],
            ),
          ),
        ),

        // Punctuation row
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: KeyboardConstants.rowSpacing),
            child: Row(
              children: [
                for (final char in [
                  '.',
                  ',',
                  '?',
                  '!',
                  '-',
                  "'",
                  '"',
                  ':',
                  ';'
                ])
                  _KeyboardKey(
                    display: char,
                    value: char,
                    keyIdentifier: char,
                    type: KeyType.special,
                    onTap: () => onLetterTap(char),
                  ),
              ],
            ),
          ),
        ),

        // Special Irish characters
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: KeyboardConstants.rowSpacing),
            child: Row(
              children: [
                for (final char in [
                  'ḃ',
                  'ċ',
                  'ḋ',
                  'ḟ',
                  'ġ',
                  'ṁ',
                  'ṗ',
                  'ṡ',
                  'ṫ'
                ])
                  _KeyboardKey(
                    display: char,
                    value: char,
                    keyIdentifier: char,
                    type: KeyType.special,
                    onTap: () => onLetterTap(char),
                  ),
                _KeyboardKey(
                  display: '⌫',
                  value: 'BACKSPACE',
                  keyIdentifier: 'BACKSPACE',
                  type: KeyType.action,
                  flex: 15,
                  onTap: () {}, // Disabled backspace functionality
                ),
              ],
            ),
          ),
        ),

        // Bottom row
        Expanded(
          child: Row(
            children: [
              _KeyboardKey(
                display: isDesktop ? 'Fada (Alt)' : 'Fada',
                value: 'FADA',
                type: KeyType.modifier,
                flex: 15,
                isActive: isFadaMode || isAltHeld,
                onTap: () =>
                    ref.read(fadaModeProvider.notifier).state = !isFadaMode,
              ),
              _KeyboardKey(
                display: '',
                value: ' ',
                keyIdentifier: ' ',
                type: KeyType.space,
                flex: 40,
                onTap: () {
                  // Ignore spacebar presses - don't count as a try
                },
              ),
              _KeyboardKey(
                display: isDesktop ? 'ABC (Tab)' : 'ABC',
                value: 'ABC',
                type: KeyType.modifier,
                flex: 15,
                onTap: () =>
                    ref.read(specialCharsModeProvider.notifier).state = false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _KeyboardKey extends ConsumerWidget {
  final String display;
  final String value;
  final String? keyIdentifier;
  final KeyType type;
  final int flex;
  final bool isActive;
  final bool hasFada;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const _KeyboardKey({
    required this.display,
    required this.value,
    this.keyIdentifier,
    required this.type,
    this.flex = 10,
    this.isActive = false,
    this.hasFada = false,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pressedKeys = ref.watch(pressedKeysProvider);
    final isPressed =
        keyIdentifier != null && pressedKeys.contains(keyIdentifier);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final isTablet = screenWidth > 600;

    // Get appropriate key height
    double keyHeight;
    if (isDesktop) {
      keyHeight = KeyboardConstants.desktopKeyHeight;
    } else if (isTablet) {
      keyHeight = KeyboardConstants.tabletKeyHeight;
    } else {
      keyHeight = KeyboardConstants.mobileKeyHeight;
    }

    // Get font size
    double fontSize;
    if (isDesktop) {
      fontSize = KeyboardConstants.desktopFontSize;
    } else if (isTablet) {
      fontSize = KeyboardConstants.tabletFontSize;
    } else {
      fontSize = KeyboardConstants.mobileFontSize;
    }

    // Adjust font size for modifiers and special characters
    if (type == KeyType.modifier && display.length > 4) {
      fontSize *= 0.8;
    } else if (type == KeyType.action) {
      fontSize *= 1.2;
    }

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: KeyboardConstants.keySpacing / 2),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            borderRadius: BorderRadius.circular(8),
            splashColor: Theme.of(context).colorScheme.primary.withAlpha(77),
            highlightColor: Theme.of(context).colorScheme.primary.withAlpha(26),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: keyHeight,
              decoration: BoxDecoration(
                color: _getKeyBackgroundColor(isPressed, context),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _getKeyBorderColor(isPressed, context),
                  width: 1.5,
                ),
                boxShadow: [
                  if (!isPressed)
                    BoxShadow(
                      color: Colors.black.withAlpha(26),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                ],
              ),
              child: Center(
                child: type == KeyType.space
                    ? Container(
                        height: 3,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(51),
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      )
                    : Text(
                        display,
                        style: TextStyle(
                          fontFamily: 'MeathFLF',
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                          color: _getKeyTextColor(isPressed, context),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getKeyBackgroundColor(bool isPressed, BuildContext context) {
    if (isPressed) {
      return hasFada
          ? Theme.of(context).colorScheme.primary
          : Colors.green.withAlpha(51);
    }
    if (isActive) {
      return Theme.of(context).colorScheme.primary.withAlpha(51);
    }
    if (hasFada) {
      return Theme.of(context).colorScheme.primary.withAlpha(26);
    }
    return Theme.of(context).colorScheme.surface;
  }

  Color _getKeyBorderColor(bool isPressed, BuildContext context) {
    if (isPressed) {
      return hasFada ? Theme.of(context).colorScheme.primary : Colors.green;
    }
    if (isActive) {
      return Theme.of(context).colorScheme.primary;
    }
    return Colors.grey.shade400;
  }

  Color _getKeyTextColor(bool isPressed, BuildContext context) {
    if (type == KeyType.modifier && isActive) {
      return Theme.of(context).colorScheme.primary;
    }
    return Theme.of(context).colorScheme.onSurface;
  }
}
