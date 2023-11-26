import 'package:do_it/screens/home_screen/components/to_do_item.dart';
import 'package:flutter/material.dart';

class DayList extends StatelessWidget {
  const DayList({super.key, required this.isCurrent});

  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 24.0,
        ),
        if (isCurrent)
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (_, index) => const ToDoItem(),
            ),
          ),
      ],
    );
  }
}
