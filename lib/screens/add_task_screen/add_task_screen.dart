import 'package:do_it/config/constants/theme.dart';
import 'package:do_it/shared/components/streak_info.dart';
import 'package:do_it/shared/providers/date_provider.dart';
import 'package:do_it/shared/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Task task = Task(
    title: "",
    scheduledOn: DateTime.now().toString(),
  );

  @override
  Widget build(BuildContext context) {
    DateProvider dateProvider = Provider.of<DateProvider>(context);
    Size size = MediaQuery.of(context).size;
    int maxCharacterLimit = 200;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StreakInfo(),
          SizedBox(
            height: 80.0,
            child: PageView.builder(
              itemBuilder: (_, idx) => Text(
                dateProvider.getDaysForDisplay(dateProvider.days[idx]),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              itemCount: dateProvider.days.length,
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              controller: PageController(
                viewportFraction: 0.8,
                initialPage: dateProvider.currentPageIndex,
              ),
              onPageChanged: (index) => dateProvider.updateCurrentDate(index),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              children: [
                TextField(
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Enter Your Task...",
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: kSecondaryColor.withAlpha(24),
                        ),
                    counterText: "${task.title.length}/$maxCharacterLimit",
                    counterStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                  autofocus: true,
                  cursorColor: kAccentColor,
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  scribbleEnabled: true,
                  maxLength: maxCharacterLimit,
                  onChanged: (val) {
                    task.title = val;
                    setState(() {});
                  },
                  onSubmitted: (_) {
                    task.scheduledOn = dateProvider.currentDate;
                    Provider.of<Tasks>(context, listen: false).saveTask(task);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
