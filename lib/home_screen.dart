import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Wrap(
          spacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {
                // /lesson/:id
                context.pushNamed('lesson',
                    pathParameters: {'id': 'dummy_lesson'});
              },
              child: const Text('Open Lesson 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // /lesson2/:id
                context.pushNamed('lesson2',
                    pathParameters: {'id': 'dummy_lesson_2'});
              },
              child: const Text('Open Lesson 2'),
            ),
          ],
        ),
      ),
    );
  }
}
