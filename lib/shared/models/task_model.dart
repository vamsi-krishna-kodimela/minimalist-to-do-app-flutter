import 'package:uuid/uuid.dart';

class Task {
  String _id;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String _title;

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  DateTime _scheduledOn;

  DateTime get scheduledOn => _scheduledOn;

  set scheduledOn(DateTime value) {
    _scheduledOn = value;
  }

  bool isCompleted;

  Task({
    String? id,
    required String title,
    required String scheduledOn,
    this.isCompleted = false,
  })  : _id = id ?? const Uuid().v1(),
        _title = title,
        _scheduledOn = DateTime.parse(scheduledOn);
}
