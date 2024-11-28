// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserTypeCarousel extends StatefulWidget {
  @override
  _UserTypeCarouselState createState() => _UserTypeCarouselState();
}

class _UserTypeCarouselState extends State<UserTypeCarousel> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  final List<UserTypeData> userTypes = [
    UserTypeData(
      title: 'Customer',
      description: 'Shop with ease and secure payments',
      color: Colors.blue,
      icon: Icons.person_outline,
      features: [
        'Secure Payment Gateway',
        'Order Tracking',
        'Exclusive Deals',
        'Digital Wallet'
      ],
      paymentMethods: [
        'Credit/Debit Cards',
        'UPI',
        'Net Banking',
        'Digital Wallets'
      ],
    ),
    UserTypeData(
      title: 'Vendor',
      description: 'Manage your business efficiently',
      color: Colors.green,
      icon: Icons.store,
      features: [
        'Sales Analytics',
        'Inventory Management',
        'Multiple Payment Options',
        'Business Insights'
      ],
      paymentMethods: [
        'Bank Transfer',
        'Payment Gateway',
        'Business Cards',
        'International Payments'
      ],
    ),
    UserTypeData(
      title: 'Franchisee',
      description: 'Expand your business network',
      color: Colors.purple,
      icon: Icons.admin_panel_settings,
      features: [
        'Multi-location Management',
        'Revenue Sharing',
        'Centralized Billing',
        'Financial Reports'
      ],
      paymentMethods: [
        'Corporate Banking',
        'Business Loans',
        'Franchise Fees',
        'Revenue Distribution'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Choose Your Role',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      // Show help dialog
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Carousel Slider
            CarouselSlider(
              // carouselController: _carouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                viewportFraction: 0.85,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: userTypes.map((userType) {
                return Builder(
                  builder: (BuildContext context) {
                    return _buildUserTypeCard(userType);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Carousel Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: userTypes.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: userTypes[_currentIndex].color.withOpacity(
                        _currentIndex == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTypeCard(UserTypeData userType) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: userType.color.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    userType.color,
                    userType.color.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      userType.icon,
                      size: 60,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userType.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userType.description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Features Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Key Features',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ...userType.features.map((feature) => _buildFeatureItem(
                        feature,
                        userType.color,
                      )),
                  const SizedBox(height: 20),
                  const Text(
                    'Payment Options',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildPaymentSection(userType),
                ],
              ),
            ),
            // Action Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to registration
                },
                child: const Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: userType.color,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.check_circle_outline,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            feature,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSection(UserTypeData userType) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPaymentIcon(Icons.credit_card, 'Cards'),
              _buildPaymentIcon(Icons.account_balance, 'Bank'),
              _buildPaymentIcon(Icons.phone_android, 'UPI'),
              _buildPaymentIcon(Icons.account_balance_wallet, 'Wallet'),
            ],
          ),
          const SizedBox(height: 15),
          ...userType.paymentMethods.map((method) => _buildPaymentMethod(method)),
        ],
      ),
    );
  }

  Widget _buildPaymentIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, size: 24),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildPaymentMethod(String method) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Text(method),
        ],
      ),
    );
  }
}

extension on CarouselController {
  animateToPage(int key) {}
}

class UserTypeData {
  final String title;
  final String description;
  final Color color;
  final IconData icon;
  final List<String> features;
  final List<String> paymentMethods;

  UserTypeData({
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
    required this.features,
    required this.paymentMethods,
  });
}