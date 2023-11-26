import 'package:do_it/shared/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteService {
  static Future<Database> initialize() async {
    return await openDatabase(
      'do_it_app.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await createTable(db);
      },
    );
  }

  static Future createTable(Database db) async {
    await db.execute(
        'CREATE TABLE Tasks (id integer primary key autoincrement, title text not null, scheduledOn TEXT, isCompleted integer not null)');
  }

  static Future<Task> insert(Database db, Task task) async {
    task.id = await db.insert("Tasks", task.toMap());
    print(task.id);
    return task;
  }

  Future<Task?> getTodo(Database db, int id) async {
    List<Map> maps = await db.query("Tasks",
        columns: ["id", "title", "scheduledOn", "isCompleted"],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      final record = maps[0];
      return Task(
          scheduledOn: record['scheduledOn'],
          id: record['id'],
          title: record['title'],
          isCompleted: record['isCompleted']);
    }
    return null;
  }

  static Future<int> delete(Database db, int id) async {
    return await db.delete("Tasks", where: '$id = ?', whereArgs: [id]);
  }

  static Future<int> update(Database db, Task task) async {
    return await db
        .update("Tasks", task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<List<Task>> getAllTasks(Database db) async {
    List<Map<String, dynamic>> records = await db.query('Tasks');
    print(records);
    return records
        .map(
          (record) => Task(
            scheduledOn: record['scheduledOn'],
            id: record['id'],
            title: record['title'],
            isCompleted: record['isCompleted'] == 1,
          ),
        )
        .toList();
  }

  Future close(Database db) async => db.close();
}
