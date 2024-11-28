// ignore_for_file: use_super_parameters, prefer_const_constructors, unnecessary_const, unused_import

import 'package:flutter/material.dart';
import 'package:myapp/accountacreate.dart';
import 'package:myapp/step.dart';
import 'package:myapp/usertype.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            const SizedBox(height: 30),

            // Circle with logo

            const Text(
              'Please login to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'poppins',
                  color: Color.fromARGB(255, 22, 19, 19),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 33),
            // Email TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'email@address.com',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Color(0xFF0A1F44),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFF0A1F44),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF0A1F44),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Sign In Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MPINEntryPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 145, 255, 149),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0A1F44),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'or continue with',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
            const SizedBox(height: 15),
            // Create Account Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont have an account?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 26, 24, 24),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: const Text(
                    'Create one',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF0A1F44),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
