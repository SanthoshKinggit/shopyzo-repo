// ignore_for_file: use_super_parameters, prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:myapp/accountacreate.dart';
import 'package:myapp/createac.dart';
import 'package:myapp/login.dart';
import 'package:myapp/prime.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/logo/6333204.jpg',
                    height: 222,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
                          height: 25,
                        ),
                        const Text(
                          '    Continue with Facebook',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/Google_Icons-09-512.webp',
                          height: 25,
                        ),
                        const Text(
                          '    Continue with Google',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/apple-logo-transparent.png',
                          height: 25,
                        ),
                        const Text(
                          '    Continue with Apple',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    'or',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(height: 20),
                  // App Name
                  Column(
                    children: [
                      // const SizedBox(height: 22),
                      // // Subtitle
                      // const Text(
                      //   'A platform where you can manage your money',
                      //   style: TextStyle(
                      //     fontFamily: 'Nunito',
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w500,
                      //     color: Color.fromARGB(255, 91, 91, 91),
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      const SizedBox(height: 0),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage1()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Sign up Button
                      // OutlinedButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const SignUpScreen()),
                      //     );
                      //   },
                      //   style: OutlinedButton.styleFrom(
                      //     minimumSize: const Size(double.infinity, 56),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(16),
                      //     ),
                      //     side: const BorderSide(
                      //         color: Color(0xFF0A1F44), width: 1),
                      //   ),
                      //   child: const Text(
                      //     'Sign up',
                      //     style: TextStyle(
                      //       fontFamily: 'Nunito',
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.bold,
                      //       color: Color(0xFF0A1F44),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 16),
                      // const SizedBox(height: 15),

                      // Center(
                      //   child: Text(
                      //     'or continue with',
                      //     style: TextStyle(
                      //       fontSize: 14,
                      //       fontFamily: 'Nunito',
                      //       fontWeight: FontWeight.w500,
                      //       color: Color.fromARGB(255, 91, 91, 91),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 25),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Image.asset(
                      //       'assets/logo/Google_Icons-09-512.webp',
                      //       height: 40,
                      //     ),
                      //     Image.asset(
                      //       'assets/logo/apple-logo-transparent.png',
                      //       height: 32,
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont have an account?',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Color.fromARGB(255, 26, 24, 24),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homepage1()));
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
