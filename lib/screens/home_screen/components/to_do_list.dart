import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> days = [10, 20];
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          left: 16.0,
          right: 32.0,
        ),
        child: Row(
          children: days.map((day) => const DayList()).toList(),
        ),
      ),
    );
  }
}

class DayList extends StatelessWidget {
  const DayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Expanded(
          child: SizedBox(
            width: size.width - 48.0,
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(
                    "Todo item goes here....Todo item goes here....Todo item goes here....",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  contentPadding: EdgeInsets.zero,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
