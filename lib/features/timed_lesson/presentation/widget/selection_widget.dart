import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/selection_provider.dart';

enum SelectionType {
  number,
  sentence,
  color,
}

class SelectionPanel extends ConsumerWidget {
  const SelectionPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      //margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const SizedBox(height: 14),
            // Use shrink-wrapped ListView inside Column
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: SelectionType.values.length,
              separatorBuilder: (_, __) => Divider(
                color: Theme.of(context).dividerColor.withOpacity(.4),
              ),
              itemBuilder: (context, index) {
                final SelectionType lap = SelectionType.values[index];

                return GestureDetector(
                    onTap: () {
                      ref.read(selectionProvider.notifier).state = lap.name;
                    },
                    child: Text(
                      lap.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
