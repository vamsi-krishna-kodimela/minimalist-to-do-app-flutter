import 'package:do_it/screens/add_task_screen/add_task_screen.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/theme.dart';

class ActionButtons extends StatelessWidget {
  ActionButtons({super.key});

  final GlobalKey _addButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton.filledTonal(
            key: _addButtonKey,
            onPressed: () {
              final RenderBox fabRenderBox =
                  _addButtonKey.currentContext?.findRenderObject() as RenderBox;
              final fabSize = fabRenderBox.size;
              final fabOffset = fabRenderBox.localToGlobal(Offset.zero);
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (ctx, animation, secondaryAnimation) =>
                      AddTaskScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    if (animation.value == 1.0) return child;
                    final borderTween = BorderRadiusTween(
                      begin: BorderRadius.circular(fabSize.width / 2),
                      end: BorderRadius.circular(0.0),
                    );
                    final sizeTween = SizeTween(
                      begin: fabSize,
                      end: MediaQuery.of(context).size,
                    );
                    final offsetTween = Tween<Offset>(
                      begin: fabOffset,
                      end: Offset.zero,
                    );
                    final easeInAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeIn,
                    );
                    final easeOutAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    );

                    final offset = offsetTween.evaluate(animation);
                    final radius = borderTween.evaluate(easeInAnimation);
                    final size = sizeTween.evaluate(easeInAnimation);
                    return Stack(
                      children: [
                        Positioned(
                          height: size!.height,
                          width: size!.width,
                          left: offset.dx,
                          top: offset.dy,
                          child: ClipRRect(
                            borderRadius: radius!,
                            child: child,
                          ),
                        ),
                        Positioned(
                          height: size!.height,
                          width: size!.width,
                          left: offset.dx,
                          top: offset.dy,
                          child: ClipRRect(
                            borderRadius: radius!,
                            child: Opacity(
                              opacity: 1 - easeOutAnimation.value,
                              child: IconButton.filledTonal(
                                onPressed: () {},
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
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
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
