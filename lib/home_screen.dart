import 'package:flutter/material.dart';
import 'routes.dart';

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
                const LessonRoute(id: 'dummy_lesson1').go(context);
              },
              child: const Text('Open Lesson 1'),
            ),
            ElevatedButton(
              onPressed: () {
                const LessonRoute(id: 'dummy_lesson2').go(context);
              },
              child: const Text('Open Lesson 2'),
            ),
          ],
        ),
      ),
    );
  }
}
