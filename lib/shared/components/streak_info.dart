import 'package:do_it/shared/providers/date_provider.dart';
import 'package:do_it/shared/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreakInfo extends StatelessWidget {
  const StreakInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    final tasksProvider = Provider.of<Tasks>(context);
    int streak = tasksProvider.getTaskCount(dateProvider.currentDate);
    int pendingTasks = tasksProvider.getTaskCount(dateProvider.currentDate);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: 64.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$streak Day Streak',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'TASKS FOR ${dateProvider.getDaysForDisplay(dateProvider.currentDate).toUpperCase()} - $pendingTasks',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
