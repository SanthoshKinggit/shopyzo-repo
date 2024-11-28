// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:myapp/slider.dart';
import 'dart:math' as math;




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4169E1),
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: const Color(0xFF4169E1),
        //   primary: const Color(0xFF4169E1),
        // ),
        useMaterial3: true,
      ),
      home: const SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return TechSplashScreen(
      logoPath:
          'assets/logo/2222-removebg-preview.png', // Make sure to add your logo in assets
      primaryColor: Theme.of(context).primaryColorDark,
      onAnimationComplete: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => OnboardingScreen()),
        );
      },
    );
  }
}

class TechSplashScreen extends StatefulWidget {
  final String logoPath;
  final Color primaryColor;
  final VoidCallback onAnimationComplete;

  const TechSplashScreen({
    Key? key,
    required this.logoPath,
    required this.primaryColor,
    required this.onAnimationComplete,
  }) : super(key: key);

  @override
  _TechSplashScreenState createState() => _TechSplashScreenState();
}

class _TechSplashScreenState extends State<TechSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _rotationAnimation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeInOut),
    ));

    _scaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.8, curve: Curves.easeInOut),
    ));

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
    ));

    _controller.forward().then((_) {
      widget.onAnimationComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.primaryColor,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer rotating circles
                      Transform.rotate(
                        angle: _rotationAnimation.value,
                        child: CustomPaint(
                          painter: CircularTechPatternPainter(
                            progress: _controller.value,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          size: const Size(300, 300),
                        ),
                      ),
                      // Logo with scale and opacity animation
                      Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Opacity(
                          opacity: _opacityAnimation.value,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Image.asset(
                              widget.logoPath,
                              color: widget.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Image.asset(
              'assets/logo/Frame 1 (1).png',height: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class CircularTechPatternPainter extends CustomPainter {
  final double progress;
  final Color color;

  CircularTechPatternPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw tech pattern circles
    for (int i = 0; i < 3; i++) {
      final currentRadius = radius * (0.6 + (i * 0.2));
      canvas.drawCircle(center, currentRadius, paint);

      // Draw arc segments
      final rect = Rect.fromCircle(center: center, radius: currentRadius);
      for (int j = 0; j < 12; j++) {
        final startAngle = (j * math.pi / 6);
        final sweepAngle = math.pi / 12;
        canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
      }
    }

    // Draw connecting lines
    for (int i = 0; i < 12; i++) {
      final angle = (i * math.pi / 6);
      final innerPoint = Offset(
        center.dx + (radius * 0.6) * math.cos(angle),
        center.dy + (radius * 0.6) * math.sin(angle),
      );
      final outerPoint = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.drawLine(innerPoint, outerPoint, paint);
    }
  }

  @override
  bool shouldRepaint(CircularTechPatternPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
