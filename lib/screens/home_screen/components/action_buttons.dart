import 'package:flutter/material.dart';

import '../../../config/constants/theme.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton.filledTonal(
            onPressed: () => {},
            icon: const Icon(
              Icons.add,
            ),
            color: kSecondaryColor,
            style: IconButton.styleFrom(
              backgroundColor: kAccentColor,
              padding: const EdgeInsets.all(
                14.0,
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          IconButton.filledTonal(
            onPressed: () => {},
            icon: const Icon(
              Icons.menu,
            ),
            color: kAccentColor,
            style: IconButton.styleFrom(
              backgroundColor: kSecondaryColor,
              padding: const EdgeInsets.all(
                14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
