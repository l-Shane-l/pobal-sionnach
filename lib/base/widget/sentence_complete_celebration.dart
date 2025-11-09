// lib/presentation/widgets/sentence_complete_celebration.dart
import 'package:flutter/material.dart';

class SentenceCompleteCelebration extends StatelessWidget {
  final VoidCallback onNextSentence;
  final bool isLastSentence;

  const SentenceCompleteCelebration({
    super.key,
    required this.onNextSentence,
    required this.isLastSentence,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Maith thú!',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onNextSentence,
            child: Text(isLastSentence ? 'Finish' : 'Next'),
          ),
        ],
      ),
    );
  }
}
