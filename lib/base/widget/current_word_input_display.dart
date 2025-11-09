// lib/presentation/widgets/current_word_input_display.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentWordInputDisplay extends ConsumerWidget {
  final String targetWord;
  final String userInput;
  final bool isCorrect;
  final bool isRevealed;
  final Function(int xp, int words) onCorrect;

  const CurrentWordInputDisplay({
    super.key,
    required this.targetWord,
    required this.userInput,
    required this.isCorrect,
    required this.isRevealed,
    required this.onCorrect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (userInput.toLowerCase() == targetWord.toLowerCase()) {
      // Use addPostFrameCallback to avoid calling setState during a build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onCorrect(10, 1);
      });
    }

    // Build letter slots like the original
    List<Widget> letterSlots = [];
    for (int i = 0; i < targetWord.length; i++) {
      String displayChar = '_';
      Color bgColor = Colors.grey.shade200;
      Color textColor = Colors.black;
      
      if (isRevealed) {
        displayChar = targetWord[i];
        bgColor = Colors.orange.shade100;
      } else if (i < userInput.length) {
        displayChar = userInput[i];
        if (userInput[i].toLowerCase() == targetWord[i].toLowerCase()) {
          bgColor = Colors.green.shade100;
          textColor = Colors.green.shade900;
        } else {
          bgColor = Colors.red.shade100;
          textColor = Colors.red.shade900;
        }
      }
      
      letterSlots.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: 40,
          height: 50,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: i == userInput.length ? Colors.blue : Colors.grey.shade400,
              width: i == userInput.length ? 2 : 1,
            ),
          ),
          child: Center(
            child: Text(
              displayChar,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: letterSlots,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => onCorrect(10, 1),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange.shade100,
            foregroundColor: Colors.brown,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text("I'm Stuck"),
        )
      ],
    );
  }
}
