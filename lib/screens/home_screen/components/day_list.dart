import 'package:do_it/screens/home_screen/components/to_do_item.dart';
import 'package:do_it/shared/providers/date_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/models/task_model.dart';
import '../../../shared/providers/task_provider.dart';

class DayList extends StatelessWidget {
  const DayList({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    DateProvider dateProvider = Provider.of<DateProvider>(context);
    final Tasks tasksProvider = Provider.of<Tasks>(context);

    List<Task> tasks = tasksProvider.getTasksByDate(dateTime);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateProvider.getDaysForDisplay(dateTime),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 24.0,
        ),
        if (dateProvider.isCurrentDate(dateTime) == true)
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, index) => ToDoItem(
                task: tasks[index],
              ),
            ),
          ),
      ],
    );
  }
}
