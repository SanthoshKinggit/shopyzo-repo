// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/prime.dart';
import 'package:myapp/signup.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Animation controllers
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _buttonController;

  // Animations
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _buttonScaleAnimation;
  late Animation<double> _buttonFadeAnimation;

  final List<Map<String, dynamic>> _contents = [
    {
      'title': 'Order',
      'description': 'The best app for finance. banking. & e-wallet today',
      'image': 'assets/logo/4676729-removebg-preview.png',
      'gradient': [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
      ],
    },
    {
      'title': 'Shop',
      'description': 'Have an amazing experience with Allpay right now!',
      'image': 'assets/logo/6077503.jpg',
      'gradient': [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
      ],
    },
    {
      'title': 'Fast Payment',
      'description': ' Mange finances eaasily with secure payments',
      'image': 'assets/logo/6036950.jpg',
      'gradient': [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
      ],
    },
  ];

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    // Setup animations
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOutBack,
    ));

    _buttonScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonController,
      curve: Curves.elasticOut,
    ));

    _buttonFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonController,
      curve: Interval(0.4, 1.0, curve: Curves.easeOut),
    ));

    // Start initial animations
    Future.delayed(Duration(milliseconds: 100), () {
      _fadeController.forward();
      _slideController.forward();
      _scaleController.forward();
      _buttonController.forward();
    });
  }

  void _animateToNextPage() {
    // Reset animations
    _fadeController.reset();
    _slideController.reset();
    _scaleController.reset();

    // Animate to next page
    if (_currentIndex < _contents.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    // Start animations for new page
    Future.delayed(Duration(milliseconds: 100), () {
      _fadeController.forward();
      _slideController.forward();
      _scaleController.forward();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          ScaleTransition(
            scale: _buttonScaleAnimation,
            child: FadeTransition(
              opacity: _buttonFadeAnimation,
              child: TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        LoginScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 800),
                  ),
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: _currentIndex == 0
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _contents[_currentIndex]['gradient'],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                      _fadeController.reset();
                      _fadeController.forward();
                      _slideController.reset();
                      _slideController.forward();
                      _scaleController.reset();
                      _scaleController.forward();
                    });
                  },
                  itemCount: _contents.length,
                  itemBuilder: (context, index) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: OnboardingContent(
                            title: _contents[index]['title'],
                            description: _contents[index]['description'],
                            image: _contents[index]['image'],
                            isDarkBackground: index != 0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ScaleTransition(
                scale: _buttonScaleAnimation,
                child: FadeTransition(
                  opacity: _buttonFadeAnimation,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _contents.length,
                            (index) => TweenAnimationBuilder(
                              duration: Duration(milliseconds: 300),
                              tween: Tween<double>(
                                begin: 0.0,
                                end: _currentIndex == index ? 1.0 : 0.5,
                              ),
                              builder: (context, double value, child) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  height: 8,
                                  width: _currentIndex == index ? 24 : 8,
                                  decoration: BoxDecoration(
                                    color: (_currentIndex == 0
                                            ? const Color.fromARGB(
                                                255, 255, 255, 255)
                                            : Colors.white)
                                        .withOpacity(value),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              elevation: 8,
                            ),
                            onPressed: () {
                              if (_currentIndex == _contents.length - 1) {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        LoginScreen(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                    transitionDuration:
                                        Duration(milliseconds: 800),
                                  ),
                                );
                              } else {
                                _animateToNextPage();
                              }
                            },
                            child: Text(
                              _currentIndex == _contents.length - 1
                                  ? 'Get Started'
                                  : 'Next',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: _currentIndex == 0
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isDarkBackground;

  const OnboardingContent({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.isDarkBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Image.asset(
            image,
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(height: 0),
              Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyle(
                  color: primary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primary,
                  fontSize: 26,
                  height: 1.5,
                  fontFamily: 'Nunito',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
