import 'package:flutter/material.dart';

import '../models/task_model.dart';

class Tasks with ChangeNotifier {
  List<Task> tasks = [
    Task(
      scheduledOn: DateTime.now().toString(),
      title: "Task 1",
    ),
    Task(
      scheduledOn: DateTime.now().add(Duration(days: 1)).toString(),
      title: "Task 20",
    ),
    Task(
      scheduledOn: DateTime.now().add(Duration(days: 1)).toString(),
      title: "Task 21",
    ),
    Task(
      scheduledOn: DateTime.now().add(Duration(days: 2)).toString(),
      title: "Task 3",
    ),
    Task(
      scheduledOn: DateTime.now().add(Duration(days: 3)).toString(),
      title: "Task 3",
    ),
    Task(
      scheduledOn: DateTime.now().add(Duration(days: 3)).toString(),
      title: "Task 4",
    ),
  ];

  saveTask(Task task) {
    tasks.removeWhere((Task elem) => elem.id == task.id);
    tasks.add(task);
    notifyListeners();
  }

  List<Task> getTasksByDate(DateTime date) {
    tasks.sort((a, b) {
      return b.isCompleted ? -1 : 1;
    });
    return tasks
        .where((task) =>
            task.scheduledOn.day == date.day &&
            task.scheduledOn.month == date.month &&
            task.scheduledOn.year == date.year)
        .toList();
  }

  int getTaskCount(DateTime date) {
    return getTasksByDate(date).length;
  }

  toggleStatus(Task task) {
    task.isCompleted = !task.isCompleted;
    saveTask(task);
  }
}
