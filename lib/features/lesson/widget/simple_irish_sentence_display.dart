import 'package:flutter/material.dart';

class SimpleIrishSentenceDisplay extends StatelessWidget {
  final List<String> words;

  const SimpleIrishSentenceDisplay({
    super.key,
    required this.words,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 4.0,
      alignment: WrapAlignment.center,
      children: words.map((word) {
        return Text(
          word,
          style: Theme.of(context).textTheme.headlineSmall,
        );
      }).toList(),
    );
  }
}
