import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:async';

import 'package:myapp/usertype.dart';

class MPINEntryPage extends StatefulWidget {
  const MPINEntryPage({Key? key}) : super(key: key);

  @override
  _MPINEntryPageState createState() => _MPINEntryPageState();
}

class _MPINEntryPageState extends State<MPINEntryPage> 
    with SingleTickerProviderStateMixin {
  List<String> _pinDigits = List.filled(6, '');
  List<FocusNode> _pinFocusNodes = List.generate(6, (_) => FocusNode());
  List<TextEditingController> _pinControllers = 
      List.generate(6, (_) => TextEditingController());

  late AnimationController _animationController;
  late Animation<double> _animation;

  final _formKey = GlobalKey<FormState>();
  bool _isPinComplete = false;

  @override
  void initState() {
    super.initState();
    
    // Add animation for smooth interactions
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    for (var node in _pinFocusNodes) {
      node.dispose();
    }
    for (var controller in _pinControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onPinChanged(int index, String value) {
    setState(() {
      _pinDigits[index] = value;
      _isPinComplete = _pinDigits.every((digit) => digit.isNotEmpty);
    });

    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(_pinFocusNodes[index + 1]);
    }
  }

  void _validateAndProceed() {
    _animationController.forward(from: 0);

    if (_isPinComplete) {
      String mpin = _pinDigits.join();

      // Haptic feedback on successful MPIN creation
      HapticFeedback.lightImpact();

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => UserTypeSelection(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );

      _showSuccessSnackBar();
    } else {
      _showErrorSnackBar();
    }
  }

  void _showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              'MPIN Created Successfully!',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              'Please complete all 6 digits',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple.shade300,
                Colors.deepPurple.shade700,
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Hero(
                        tag: 'logo',
                        child: Image.asset(
                          'assets/logo/Screenshot_2024-11-27_144222-removebg-preview.png',
                          height: 200,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Create Your MPIN',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Secure your account with a 6-digit PIN',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Container(
                                width: 50,
                                height: 60,
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: _pinControllers[index],
                                  focusNode: _pinFocusNodes[index],
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  obscureText: true,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: '',
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.9),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.deepPurple.shade300,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) => _onPinChanged(index, value),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: _validateAndProceed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepPurple.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 8,
                        ),
                        child: Text(
                          'Create MPIN',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple.shade700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Contact support for assistance'),
                              backgroundColor: Colors.deepPurple.shade700,
                            ),
                          );
                        },
                        child: const Text(
                          'Need Help?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}