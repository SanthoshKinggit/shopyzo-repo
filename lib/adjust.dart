import 'package:flutter/material.dart';


class ResponsiveScreen extends StatefulWidget {
  @override
  State<ResponsiveScreen> createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth * 0.9, // 90% of screen width
          height: screenHeight * 0.5, // 50% of screen height
          alignment: Alignment.center,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Responsive sizing using FractionallySizedBox
                  FractionallySizedBox(
                    widthFactor: 0.8, // 80% of parent width
                    child: Container(
                      height: constraints.maxHeight * 0.3,
                      color: Colors.blue,
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