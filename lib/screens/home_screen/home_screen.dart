import 'package:do_it/screens/home_screen/components/streak_info.dart';
import 'package:do_it/screens/home_screen/components/to_do_list.dart';

import '../../config/constants/theme.dart';
import './components/action_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreakInfo(),
            ToDoList(),
          ],
        ),
      ),
      floatingActionButton: ActionButtons(),
    );
  }
}
