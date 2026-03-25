import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetrade_4bubble_soft/screens/auth/auth_screen.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  double progress = 0.0;

  final List<OnboardingPageData> pages = [
    OnboardingPageData(
      bgColor: const Color(0xFF4F8A9B),
      circleColor: Colors.black.withOpacity(0.2),
      image: 'assets/images/onboard1.png',
      title: 'Swap your time and unlock new perspectives.',
      subtitle:
          'Teach a skill, earn time credits, and use them to learn something new from someone else. Everyone grows together.',
    ),
    OnboardingPageData(
      bgColor: const Color(0xFFF0B45E),
      circleColor: Colors.deepOrange.withOpacity(0.25),
      image: 'assets/images/onboard3.png',
      title: 'Teach to earn. Learn to grow. Get rated. Be discovered.',
      subtitle:
          'Ratings build your reputation. Get ratings / reviews and boost up your confidence. People fuel your journey.',
    ),
    OnboardingPageData(
      bgColor: const Color(0xFFB8CF7E),
      circleColor: Colors.green.withOpacity(0.25),
      image: 'assets/images/onboard2.png',
      title:
          'Not your usual classroom. Peer-powered, driven by credit points.',
      subtitle:
          'Meet amazing people throughout your journey. Book sessions from someone you prefer. Learn different approaches to the solution.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page ?? 0;
      setState(() {
        progress = page / (pages.length - 1);
      });
    });
  }

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        itemBuilder: (context, index) {
          final page = pages[index];

          return Stack(
            children: [
              Container(color: page.bgColor),

              Positioned(
                top: 50,
                right: 20,
                child: Text(
                  'SKIP',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),

              if (currentIndex > 0)
                Positioned(
                  top: 45,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: previousPage,
                  ),
                ),

              Positioned(
                top: size.height * 0.18,
                left: size.width * 0.1,
                child: Container(
                  width: size.width * 0.8,
                  height: size.width * 0.8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: page.circleColor,
                  ),
                ),
              ),

              Positioned(
                top: size.height * 0.16,
                left: 0,
                right: 0,
                child: Image.asset(
                  page.image,
                  width: size.width * 0.68,
                ),
              ),

              Positioned(
                bottom: 130,
                left: 24,
                right: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      page.title,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      page.subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 40,
                right: 24,
                child: GestureDetector(
                  onTap: () {
                    if (currentIndex == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AuthScreen(),
                        ),
                      );
                    } else {
                      nextPage();
                    }
                  },
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          size: const Size(56, 56),
                          painter: _ProgressPainter(progress),
                        ),
                        Icon(
                          currentIndex == pages.length - 1
                              ? Icons.check
                              : Icons.arrow_forward,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/* ---------- PROGRESS RING ---------- */

class _ProgressPainter extends CustomPainter {
  final double progress;
  _ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 43, 47, 50)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 3;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

/* ---------- MODEL ---------- */

class OnboardingPageData {
  final Color bgColor;
  final Color circleColor;
  final String image;
  final String title;
  final String subtitle;

  OnboardingPageData({
    required this.bgColor,
    required this.circleColor,
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
