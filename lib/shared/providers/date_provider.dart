import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateProvider with ChangeNotifier {
  late DateTime currentDate;
  List<DateTime> days = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: 2)),
  ];

  DateProvider() {
    currentDate = days[0];
  }

  appendNextDate() {
    days.add(days.last.add(Duration(days: 1)));
  }

  updateCurrentDate(int index) {
    currentDate = days[index];
    if (days.length - index <= 2) {
      appendNextDate();
    }
    notifyListeners();
  }

  get currentPageIndex {
    return days.indexWhere((element) => element.isAtSameMomentAs(currentDate));
  }

  isCurrentDate(DateTime date) {
    return currentDate.isAtSameMomentAs(date);
  }

  String getDaysForDisplay(DateTime date) {
    final dateDiff = date.difference(days[0]);
    switch (dateDiff.inDays) {
      case 0:
        return "Today";
      case 1:
        return "Tomorrow";
      default:
        final formatter = DateFormat("dd MMM yy");
        return formatter.format(date);
    }
  }
}
