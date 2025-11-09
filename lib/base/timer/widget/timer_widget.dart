import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/timer_controller.dart';
import '../controller/state/timer_state.dart';

class ExerciseTimePanel extends ConsumerWidget {
  const ExerciseTimePanel({super.key});

  String _fmtMs(int ms) {
    final minutes = (ms ~/ 60000).toString().padLeft(2, '0');
    final seconds = ((ms % 60000) ~/ 1000).toString().padLeft(2, '0');
    final hundredths = ((ms % 1000) ~/ 10).toString().padLeft(2, '0');
    return '$minutes:$seconds.$hundredths';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerControllerProvider);

    final total = timerState.elapsedMs;
    final laps = timerState.laps;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header: total time + status
            Row(
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    timerState.running ? 'Running' : 'Stopped',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  backgroundColor: timerState.running
                      ? Colors.green.withOpacity(.12)
                      : Colors.grey.withOpacity(.12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              _fmtMs(total),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontFeatures: const [FontFeature.tabularFigures()]),
            ),
            const SizedBox(height: 12),
            Divider(color: Theme.of(context).dividerColor),

            // Laps list
            Row(
              children: [
                Text('Items', style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                if (laps.isNotEmpty)
                  Text('${laps.length}',
                      style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: 8),

            // Use shrink-wrapped ListView inside Column
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: laps.length,
              separatorBuilder: (_, __) => Divider(
                color: Theme.of(context).dividerColor.withOpacity(.4),
              ),
              itemBuilder: (context, index) {
                final Lap lap = laps[index];
                final isOpen = lap.isOpen && timerState.running;

                // Show live duration for an open lap (since start of lap)
                final durationMs = isOpen
                    ? (timerState.elapsedMs - lap.startMs)
                    : lap.durationMs;

                final extras = lap.extras;

                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 14,
                    child: Text('${index + 1}',
                        style: const TextStyle(fontSize: 12)),
                  ),
                  title: Text(
                    lap.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    isOpen ? 'In progress' : 'Completed',
                    style: TextStyle(
                      color: isOpen ? Colors.orange : Colors.grey,
                    ),
                  ),
                  trailing: Text(
                    '${_fmtMs(durationMs)} / ${extras}x',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
