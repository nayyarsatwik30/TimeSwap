import 'package:flutter/material.dart';
import 'dart:math';

class LiquidSidebar extends StatefulWidget {
  const LiquidSidebar({super.key});

  @override
  State<LiquidSidebar> createState() => _LiquidSidebarState();
}

class _LiquidSidebarState extends State<LiquidSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SidebarPainter(_controller),
      child: SizedBox(
        width: 260,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _MenuItem("Dashboard"),
              _MenuItem("Time Trades"),
              _MenuItem("My Skills"),
              _MenuItem("Requests"),
              _MenuItem("Settings"),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  const _MenuItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class SidebarPainter extends CustomPainter {
  final Animation<double> animation;

  SidebarPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF1565C0);

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width - 40, 0);

    // Bubble waves
    for (double y = 0; y < size.height; y += 120) {
      final wave = 20 * sin(animation.value * 2 * pi + y / 100);
      path.quadraticBezierTo(
        size.width + wave,
        y + 60,
        size.width - 40,
        y + 120,
      );
    }

    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
