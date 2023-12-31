import 'package:do_it/shared/providers/date_provider.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:provider/provider.dart';
import 'day_list.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    final DateProvider dateProvider =
        Provider.of<DateProvider>(context, listen: true);

    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: PageController(
            viewportFraction: 0.8, initialPage: dateProvider.currentPageIndex),
        pageSnapping: true,
        itemBuilder: (_, index) => DayList(
          dateTime: dateProvider.days[index],
          key: Key(
            dateProvider.days[index].toString(),
          ),
        ),
        itemCount: dateProvider.days.length,
        onPageChanged: (index)async {
          final canVibrate = await Haptics.canVibrate();
          if(canVibrate){
            await Haptics.vibrate(HapticsType.light);
          }
          dateProvider.updateCurrentDate(index);
        },
      ),
    );
  }
}
