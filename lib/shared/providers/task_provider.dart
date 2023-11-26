import 'package:do_it/shared/services/sqflite_service.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';

class Tasks with ChangeNotifier {
  List<Task> tasks = [];
  late Database db;

  Tasks() {
    SQFLiteService.initialize().then((db) {
      this.db = db;
      SQFLiteService.getAllTasks(db).then((value) {
        print(value);
        tasks = [...value];
        notifyListeners();
      });
    });
  }

  Future<void> saveTask(Task task) async {
    final isNew = !tasks.any((element) => element.id == task.id);
    tasks.removeWhere((Task elem) => elem.id == task.id);
    if (isNew) {
      task = await SQFLiteService.insert(db, task);
    } else {
      await SQFLiteService.update(db, task);
    }
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

  Future<void> toggleStatus(Task task) async{
    task.isCompleted = !task.isCompleted;
    await saveTask(task);
  }
}
