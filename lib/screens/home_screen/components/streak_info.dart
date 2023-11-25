import 'package:flutter/material.dart';

class StreakInfo extends StatelessWidget {
  const StreakInfo({super.key});

  @override
  Widget build(BuildContext context) {
    int streak = 20;
    int pendingTasks = 4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$streak Day Streak',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          'TASKS FOR TODAY - $pendingTasks',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
