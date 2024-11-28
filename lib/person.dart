// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:myapp/forgot.dart';
import 'package:myapp/pin.dart';
import 'package:myapp/prime.dart';
import 'package:myapp/profile.dart';
import 'package:myapp/step.dart';

class Homepage0 extends StatefulWidget {
  const Homepage0({super.key});

  @override
  State<Homepage0> createState() => _Homepage0State();
}

class _Homepage0State extends State<Homepage0> {
  // Add controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login to\nAccount',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Email TextField
                  TextField(
                    controller: _emailController,
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {}); // Rebuild to show any validation
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey[500],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      // Add error handling
                      errorText: _isEmailValid(_emailController.text)
                          ? null
                          : 'Enter a valid email',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password TextField
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey[500],
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey[500],
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      // Add error handling
                      errorText: _isPasswordValid(_passwordController.text)
                          ? null
                          : 'Password must be at least 6 characters',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Remember me checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: BorderSide(color: Colors.grey[500]!),
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Sign up button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  PinInputScreen()),
                        );
                        final snackBar = SnackBar(
                          content: Center(child: Text('Sign Up Completed')),
                          backgroundColor: primary, // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                33.0), // Apply border radius
                          ),

                          behavior: SnackBarBehavior
                              .floating, // Make the SnackBar floating
                          margin: EdgeInsets.symmetric(
                              horizontal: 80.0,
                              vertical: 10.0), // Margin to center it
                          duration:
                              Duration(seconds: 3), // Snackbar display duration
                        );

                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar); // Show the Snackbar
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        // Add disabled state styling
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: primary,
                          fontSize: 14,
                        ),
                      )),
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      'or continue with',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: const Color.fromARGB(255, 55, 55, 55),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
                        height: 25,
                      ),
                      Image.asset(
                        'assets/logo/Google_Icons-09-512.webp',
                        height: 40,
                      ),
                      Image.asset(
                        'assets/logo/apple-logo-transparent.png',
                        height: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  Center(
                    child: InkWell(
                      onTap: () {
                        // Add sign in navigation logic here
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                          children: const [
                            TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Validation methods
  bool _isEmailValid(String email) {
    if (email.isEmpty) return true; // Don't show error for empty field
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    if (password.isEmpty) return true; // Don't show error for empty field
    return password.length >= 6;
  }

  bool _isFormValid() {
    return _isEmailValid(_emailController.text) &&
        _isPasswordValid(_passwordController.text) &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  bool _canSubmit() {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}
