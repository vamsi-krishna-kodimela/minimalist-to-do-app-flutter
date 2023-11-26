import 'package:flutter/material.dart';

import 'day_list.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<int> days = [10, 12, 13,5,6,7,8];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: PageController(viewportFraction: 0.8),
        pageSnapping: true,
        itemBuilder: (_, index) => DayList(isCurrent: currentPage == index),
        itemCount: days.length,
        onPageChanged: (index) {
          currentPage = index;
          setState(() {});
        },
      ),
    );
  }
}
