import 'package:flutter/material.dart';
import 'package:myapp/person.dart';
import 'package:myapp/prime.dart';
import 'package:myapp/profile.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06, // Responsive horizontal padding
              vertical: screenHeight * 0.02, // Responsive vertical padding
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.08),

                  // Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create your\nAccount',
                      style: TextStyle(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                        height: 1.2,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Email TextField
                  _buildTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: _isEmailValid,
                    screenWidth: screenWidth,
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Password TextField
                  _buildTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    obscureText: !_isPasswordVisible,
                    validator: _isPasswordValid,
                    screenWidth: screenWidth,
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
                  ),

                  SizedBox(height: screenHeight * 0.02),

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
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Sign up button
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.07,
                    child: ElevatedButton(
                      onPressed: _isFormValid() ? _handleSignUp : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Divider with text
                  _buildDividerWithText(screenWidth),

                  SizedBox(height: screenHeight * 0.03),

                  // Social Login Icons
                  _buildSocialLoginRow(screenWidth),

                  SizedBox(height: screenHeight * 0.03),

                  // Sign in link
                  _buildSignInLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom TextField Builder
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required bool Function(String) validator,
    required double screenWidth,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      onChanged: (value) {
        setState(() {}); // Rebuild to show validation
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontFamily: 'Nunito',
          fontSize: screenWidth * 0.04,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey[500],
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        errorText: validator(controller.text) ? null : _getErrorText(hintText),
      ),
    );
  }

  // Divider with text in the middle
  Widget _buildDividerWithText(double screenWidth) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300])),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Text(
            'or continue with',
            style: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.grey[600],
              fontSize: screenWidth * 0.035,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey[300])),
      ],
    );
  }

  // Social Login Icons
  Widget _buildSocialLoginRow(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialIcon(
          'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
          isNetwork: true,
          height: screenWidth * 0.07,
        ),
        _buildSocialIcon(
          'assets/logo/Google_Icons-09-512.webp',
          height: screenWidth * 0.1,
        ),
        _buildSocialIcon(
          'assets/logo/apple-logo-transparent.png',
          height: screenWidth * 0.08,
        ),
      ],
    );
  }

  // Social Icon Builder
  Widget _buildSocialIcon(String imagePath, {bool isNetwork = false, double? height}) {
    return GestureDetector(
      onTap: () {
        // Add social login logic
      },
      child: isNetwork
          ? Image.network(imagePath, height: height)
          : Image.asset(imagePath, height: height),
    );
  }

  // Sign In Link
  Widget _buildSignInLink() {
    return Center(
      child: InkWell(
        onTap: () {
          // Add sign in navigation logic
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
    );
  }

  // Validation methods
  bool _isEmailValid(String email) {
    if (email.isEmpty) return true;
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    if (password.isEmpty) return true;
    return password.length >= 6;
  }

  String _getErrorText(String field) {
    switch (field) {
      case 'Email':
        return 'Enter a valid email';
      case 'Password':
        return 'Password must be at least 6 characters';
      default:
        return 'Invalid input';
    }
  }

  bool _isFormValid() {
    return _isEmailValid(_emailController.text) &&
        _isPasswordValid(_passwordController.text) &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  void _handleSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage0()),
    );
    final snackBar = SnackBar(
      content: Center(child: Text('Sign Up Completed')),
      backgroundColor: primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(33.0),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}