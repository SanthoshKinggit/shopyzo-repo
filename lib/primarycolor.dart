// // import 'dart:ui';

// // final primarycolor = Color(0xFF0A1F44);
// // // import 'package:flutter/material.dart';


// // // class HomePage extends StatefulWidget {
// // //   @override
// // //   _HomePageState createState() => _HomePageState();
// // // }

// // // class _HomePageState extends State<HomePage> {
// // //   int _currentIndex = 0;

// // //   final PageController _pageController = PageController();

// // //   final List<Map<String, String>> _sliderContent = [
// // //     {
// // //       'title': 'Order',
// // //       'description': 'Place orders seamlessly with our easy-to-use system.',
// // //       'image':
// // //           'assets/logo/THG_M307_06.png', // Replace with your asset or use a placeholder.
// // //     },
// // //     {
// // //       'title': 'Shop',
// // //       'description': 'Explore a wide range of products in our shop.',
// // //       'image':
// // //           'assets/logo/man buying goods from online store PNG.png', // Replace with your asset or use a placeholder.
// // //     },
// // //     {
// // //       'title': 'Fast Payment',
// // //       'description': 'Make secure and quick payments with a few clicks.',
// // //       'image':
// // //           'assets/logo/10.png', // Replace with your asset or use a placeholder.
// // //     },
// // //   ];

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () {
// // //               Navigator.push(
// // //                 context,
// // //                 MaterialPageRoute(builder: (context) => const LoginScreen()),
// // //               );
// // //             },
// // //             child: Text(
// // //               'Skip  ',
// // //               style: TextStyle(
// // //                   fontFamily: 'Poppins',
// // //                   fontWeight: FontWeight.w500,
// // //                   fontSize: 16,
// // //                   color: Colors.black),
// // //             ),
// // //           )
// // //         ],
// // //         // title: Text(
// // //         //   'Wallet App',
// // //         //   style: TextStyle(
// // //         //       fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 26),
// // //         // ),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           children: [
// // //             Expanded(
// // //               child: PageView.builder(
// // //                 controller: _pageController,
// // //                 itemCount: _sliderContent.length,
// // //                 onPageChanged: (index) {
// // //                   setState(() {
// // //                     _currentIndex = index;
// // //                   });
// // //                 },
// // //                 itemBuilder: (context, index) {
// // //                   final content = _sliderContent[index];
// // //                   return SliderContent(
// // //                     title: content['title']!,
// // //                     description: content['description']!,
// // //                     imagePath: content['image']!,
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: List.generate(
// // //                 _sliderContent.length,
// // //                 (index) => AnimatedContainer(
// // //                   duration: Duration(milliseconds: 300),
// // //                   margin: EdgeInsets.symmetric(horizontal: 5.0),
// // //                   width: _currentIndex == index ? 12.0 : 8.0,
// // //                   height: 8.0,
// // //                   decoration: BoxDecoration(
// // //                     color: _currentIndex == index ? Color(0xFF0A1F44) : Color.fromARGB(255, 166, 171, 181),
// // //                     borderRadius: BorderRadius.circular(4.0),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             SizedBox(height: 40),
// // //             SizedBox(
// // //               width: 300,
// // //               height: 50,
// // //               child: ElevatedButton(
// // //                 style: ElevatedButton.styleFrom(
// // //                     backgroundColor: const Color.fromARGB(255, 145, 255, 149),
// // //                     shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(33))),
// // //                 onPressed: _currentIndex == _sliderContent.length - 1
// // //                     ? () {
// // //                         // Navigate to another screen
// // //                         Navigator.push(
// // //                             context,
// // //                             MaterialPageRoute(
// // //                                 builder: (context) => const LoginScreen()));
// // //                       }
// // //                     : () {
// // //                         _pageController.nextPage(
// // //                           duration: Duration(milliseconds: 500),
// // //                           curve: Curves.ease,
// // //                         );
// // //                       },
// // //                 child: Text(
// // //                   _currentIndex == _sliderContent.length - 1
// // //                       ? 'Get Started'
// // //                       : 'Next',
// // //                   style: TextStyle(color: Color(0xFF0A1F44), fontSize: 18,
// // //                         fontWeight: FontWeight.w700,
                  
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             SizedBox(height: 20),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // class SliderContent extends StatelessWidget {
// //   final String title;
// //   final String description;
// //   final String imagePath;

// //   SliderContent({
// //     required this.title,
// //     required this.description,
// //     required this.imagePath,
// //   });

// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Image.asset(
// //             imagePath,
// //             height: 300,
// //             width: 350,
// //             fit: BoxFit.cover,
// //           ),
// //           SizedBox(height: 20),
// //           Text(
// //             title,
// //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //           ),
// //           SizedBox(height: 10),
// //           Text(
// //             description,
// //             textAlign: TextAlign.center,
// //             style: TextStyle(fontSize: 16, color: Colors.grey[700]),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/signup.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late AnimationController _fadeController;
  late AnimationController _slideController;

  final List<Map<String, dynamic>> _contents = [
    {
      'title': 'Order',
      'description': 'Place orders seamlessly with our easy-to-use system.',
      'image':
          'assets/logo/THG_M307_06.png', // Replace with your asset or use a placeholder.
      'gradient': [
        Color.fromARGB(255, 255, 171, 54),
        Color.fromARGB(255, 246, 255, 153)
      ],
    },
    {
      'title': 'Shop',
      'description': 'Explore a wide range of products in our shop.',
      'image': 'assets/logo/man_buying_goods_from_online_store_PNG-removebg-preview.png',

      'gradient': [Color(0xFF0A1F44), Color.fromARGB(255, 90, 115, 158)],
    },
    {
      'title': 'Fast Payment',
      'description': 'Make secure and quick payments with a few clicks.',
      'image':
          'assets/logo/10.png', // Replace with your asset or use a placeholder.
      'gradient': [Color(0xFF1A2980), Color(0xFF26D0CE)],
    },
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
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
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            ),
            child: Text(
              'Skip',
              style: TextStyle(
                color: _currentIndex == 0 ? Colors.black : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
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
                        });
                      },
                      itemCount: _contents.length,
                      itemBuilder: (context, index) {
                        return FadeTransition(
                          opacity: _fadeController,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0.2, 0),
                              end: Offset.zero,
                            ).animate(CurvedAnimation(
                              parent: _slideController,
                              curve: Curves.easeOut,
                            )),
                            child: OnboardingContent(
                              title: _contents[index]['title'],
                              description: _contents[index]['description'],
                              image: _contents[index]['image'],
                              constraints: constraints,
                              isDarkBackground: index != 0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _contents.length,
                            (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: _currentIndex == index ? 24 : 8,
                              decoration: BoxDecoration(
                                color: (_currentIndex == 0
                                        ? Colors.black
                                        : Colors.white)
                                    .withOpacity(
                                        _currentIndex == index ? 1 : 0.5),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _currentIndex == 0
                                  ? Colors.black
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              elevation: 8,
                            ),
                            onPressed: () {
                              if (_currentIndex == _contents.length - 1) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              } else {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Text(
                              _currentIndex == _contents.length - 1
                                  ? 'Get Started'
                                  : 'Next',
                              style: TextStyle(
                                color: _currentIndex == 0
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              );
            },
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
  final BoxConstraints constraints;
  final bool isDarkBackground;

  const OnboardingContent({super.key, 
    required this.title,
    required this.description,
    required this.image,
    required this.constraints,
    required this.isDarkBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(height: 25),
            Text(
              title,
              style: TextStyle(
                color: isDarkBackground ? Colors.white : Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: (isDarkBackground ? Colors.white : Colors.black)
                    .withOpacity(0.8),
                fontSize: 16,
                height: 1.5,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}