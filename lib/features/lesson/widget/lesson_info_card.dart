import 'package:flutter/material.dart';

class LessonInfoCard extends StatelessWidget {
  final int totalSentences;
  final int currentSentenceIndex;
  final List<bool> completedSentences;
  final String englishText;

  const LessonInfoCard({
    super.key,
    required this.totalSentences,
    required this.currentSentenceIndex,
    required this.completedSentences,
    required this.englishText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey.shade200,
      child: Column(
        children: [
          // Progress dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalSentences, (index) {
              Color dotColor;
              if (completedSentences[index]) {
                dotColor = Colors.green;
              } else if (index == currentSentenceIndex) {
                dotColor = Colors.orange;
              } else {
                dotColor = Colors.grey.shade400;
              }
              
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          // English prompt
          Text(
            englishText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
