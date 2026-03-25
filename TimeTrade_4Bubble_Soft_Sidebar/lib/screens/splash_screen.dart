import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController dropController;
  late AnimationController textController;
  late AnimationController scaleController;

  late Animation<Offset> dropAnimation;
  late Animation<double> textFade;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    dropController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    dropAnimation = Tween<Offset>(
      begin: const Offset(0, -1.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: dropController,
        curve: Curves.easeOutBack,
      ),
    );

    textFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: textController,
        curve: Curves.easeIn,
      ),
    );

    scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: scaleController,
        curve: Curves.easeOut,
      ),
    );

    startAnimation();
  }

  Future<void> startAnimation() async {
    scaleController.forward();
    await dropController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    await textController.forward();

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacementNamed(context, '/onboarding');
  }
  @override
  void dispose() {
    dropController.dispose();
    textController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      body: Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// CLOCK WITH GRADIENT S
              SlideTransition(
                position: dropAnimation,
                child: SizedBox(
                  height: 125,
                  width: 125,
                  child: CustomPaint(
                    painter: ClockPainter(),
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return const RadialGradient(
                            center: Alignment(0, -0.2),
                            radius: 1.1,
                            colors: [
                              Color(0xFF669BBC),
                              Color(0xFF2F4756),
                            ],
                          ).createShader(bounds);
                        },
                        child: Text(
                          "S",
                          style: GoogleFonts.montserrat(
                            fontSize: 52,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              /// RADIAL GRADIENT TIME SWAP TEXT
              FadeTransition(
                opacity: textFade,
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return const RadialGradient(
                      center: Alignment(0, -0.2),
                      radius: 1.1,
                      colors: [
                        Color(0xFF669BBC),
                        Color(0xFF2F4756),
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    "TIME SWAP",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 4,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final circlePaint = Paint()
      ..color = const Color.fromRGBO(230, 236, 240, 1)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, circlePaint);

    final tickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 12; i++) {
      final angle = (2 * pi / 12) * i;

      final start = Offset(
        center.dx + (radius - 14) * cos(angle - pi / 2),
        center.dy + (radius - 14) * sin(angle - pi / 2),
      );

      final end = Offset(
        center.dx + (radius - 6) * cos(angle - pi / 2),
        center.dy + (radius - 6) * sin(angle - pi / 2),
      );

      canvas.drawLine(start, end, tickPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


