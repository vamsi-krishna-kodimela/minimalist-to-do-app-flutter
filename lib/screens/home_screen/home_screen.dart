import 'package:do_it/screens/home_screen/components/streak_info.dart';
import 'package:do_it/screens/home_screen/components/to_do_list.dart';

import '../../config/constants/theme.dart';
import './components/action_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreakInfo(),
              SizedBox(
                height: 64.0,
              ),
              ToDoList(),
            ],
          ),
        ),
      ),
      floatingActionButton: ActionButtons(),
    );
  }
}
