// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/homepage.dart';
import 'package:myapp/prime.dart';

abstract class _PaymentAppState extends State<PaymentApp> {
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  // List of image paths
  final List<String> imagePaths = [
    'assets/logo/0119b7454430bb9b203d3c6b113f5e21.png',
    'assets/logo/banners3.png',
    'assets/logo/banners2.png',
    'assets/logo/22bb2.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85, // This will show a bit of next/previous images
    );
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // Replace your existing SingleChildScrollView with this Widget
  Widget _buildImageCarousel() {
    return Column(
      children: [
        Container(
          height: 160,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        // Page Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imagePaths.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? primary
                    : Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
