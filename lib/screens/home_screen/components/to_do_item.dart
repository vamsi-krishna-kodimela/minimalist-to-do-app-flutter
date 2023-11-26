import 'package:animated_line_through/animated_line_through.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/theme.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({
    super.key,
  });

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem>
    with SingleTickerProviderStateMixin {
  bool isDone = false;
  late AnimationController _controller;
  late Animation<double> _touchAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _touchAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  RenderBox? renderBox;
  TapDownDetails? touchPoint;
  OverlayEntry? touchElement;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _touchAnimation,
      builder: (ctx, __) => GestureDetector(
        onTapDown: (TapDownDetails details) {
          _touchAnimation.removeListener(renderTouchPoint);
          _controller.reset();
          _controller.forward();
          RenderObject? renderObject = ctx.findRenderObject();
          renderBox = renderObject as RenderBox;
          touchPoint = details;
          if (renderBox is RenderBox) {
            _touchAnimation.addListener(renderTouchPoint);
          }
        },
        onTap: () {
          isDone = !isDone;
        },
        onLongPress: () {
          // ToDo: Show Edit Options
        },
        onDoubleTap: () {
          // ToDo: Show Edit Options
        },
        child: ListTile(
          title: AnimatedLineThrough(
            isCrossed: isDone,
            color: kAccentColor,
            duration: const Duration(milliseconds: 400),
            strokeWidth: 2.0,
            child: Text(
              "Todo item goes here....Todo item goes here....Todo item goes here....",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 16.0,
          ),
          splashColor: Colors.transparent,
        ),
      ),
    );
  }

  renderTouchPoint() {
    if (touchElement != null) {
      touchElement!.remove();
      touchElement = null;
    }
    if (renderBox is RenderBox && touchPoint is TapDownDetails) {
      Offset offset = renderBox!.localToGlobal(touchPoint!.localPosition);
      CustomPaint customPaint = CustomPaint(
        painter: CirclePainter(
          offset: offset,
          radius: 20.0 * _touchAnimation.value,
          color: kAccentColor,
          animatedValue: _touchAnimation.value,
        ),
      );
      touchElement = OverlayEntry(builder: (context) => customPaint);
      OverlayState overlay = Overlay.of(context);
      overlay.insert(touchElement!);

      Future.delayed(const Duration(milliseconds: 200), () {
        if (touchElement != null) {
          touchElement!.remove();
          touchElement = null;
        }
      });
    }
  }
}

class CirclePainter extends CustomPainter {
  final Offset offset;
  final double radius;
  final Color color;
  final double animatedValue;

  CirclePainter(
      {required this.offset,
      required this.radius,
      required this.color,
      required this.animatedValue});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0 * (1.0 - animatedValue);

    canvas.drawCircle(offset, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
