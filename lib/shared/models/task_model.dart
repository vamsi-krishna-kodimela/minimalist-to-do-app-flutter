class Task {
  int _id;

  int get id => _id;

  set id(int value) {
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
    int? id,
    required String title,
    required String scheduledOn,
    this.isCompleted = false,
  })  : _id = id ?? DateTime.now().microsecondsSinceEpoch,
        _title = title,
        _scheduledOn = DateTime.parse(scheduledOn);

  toMap() {
    return {
      "title": title,
      "scheduledOn": scheduledOn.toString(),
      "isCompleted": isCompleted ? 1 : 0
    };
  }
}
