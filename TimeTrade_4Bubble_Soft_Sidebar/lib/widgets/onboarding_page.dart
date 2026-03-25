import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final Color bgColor;
  final Color circleColor;
  final String imagePath;
  final String title;
  final String subtitle;
  final Color arrowColor;
  final VoidCallback onNext;

  const OnboardingPage({
    super.key,
    required this.bgColor,
    required this.circleColor,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.arrowColor,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // SKIP
          Positioned(
            top: 50,
            right: 20,
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // CIRCLE
          Positioned(
            top: size.height * 0.18,
            left: size.width * 0.1,
            child: Container(
              width: size.width * 0.8,
              height: size.width * 0.8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
              ),
            ),
          ),

          // IMAGE (slightly above to fill circle)
          Positioned(
            top: size.height * 0.16, // 🔥 THIS is the key fix
            left: 0,
            right: 0,
            child: Image.asset(
              imagePath,
              width: size.width * 0.68,
              fit: BoxFit.contain,
            ),
          ),

          // TEXT
          Positioned(
            bottom: 130,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),

          // NEXT BUTTON
          Positioned(
            bottom: 40,
            right: 24,
            child: GestureDetector(
              onTap: onNext,
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: arrowColor, width: 2),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: arrowColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
