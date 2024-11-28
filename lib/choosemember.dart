// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:myapp/homepage.dart';

// Placeholder screens with Hero animations
class customer extends StatefulWidget {
  const customer({super.key});

  @override
  State<customer> createState() => _customerState();
}

class _customerState extends State<customer> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentApp()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.help,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'Customer Registration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(children: [
          const WaveBackground1(),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: ListView(
                children: [
                  TextField(
                    controller: _emailController,
                    cursorColor: Colors.blue,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {}); // Rebuild to show any validation
                    },
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255)
                        // Add error handling
                        ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _nameController,
                    cursorColor: Colors.blue,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {}); // Rebuild to show any validation
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      // Add error handling
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _phoneController,
                    cursorColor: Colors.blue,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {}); // Rebuild to show any validation
                    },
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      // Add error handling
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentApp()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class WaveBackground1 extends StatelessWidget {
  const WaveBackground1({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavePainter1(),
      child: Container(),
    );
  }
}

class WavePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define colors
    final lightBlue = Color.fromARGB(255, 239, 249, 255);
    final mediumBlue = Color(0xFF90CAF9);
    final darkBlue = Color(0xFF2196F3);

    // Create gradient paint
    final Paint gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [lightBlue, mediumBlue],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Draw background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = lightBlue,
    );

    // Draw top-left circle
    final topLeftCircle = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width * 0.2, size.height * 0.2),
        radius: size.width * 0.3,
      ));
    canvas.drawPath(
      topLeftCircle,
      Paint()
        ..color = darkBlue.withOpacity(0.2)
        ..style = PaintingStyle.fill,
    );

    // Draw bottom-right circle
    final bottomRightCircle = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width * 0.8, size.height * 0.8),
        radius: size.width * 0.3,
      ));
    canvas.drawPath(
      bottomRightCircle,
      Paint()
        ..color = darkBlue.withOpacity(0.2)
        ..style = PaintingStyle.fill,
    );

    // Draw center circle with gradient
    final centerCircle = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width * 0.5, size.height * 0.4),
        radius: size.width * 0.25,
      ));
    canvas.drawPath(centerCircle, gradientPaint);

    // Add subtle wave effect
    final wavePath = Path();
    wavePath.moveTo(0, size.height * 0.7);

    // Create curved wave path
    var firstControlPoint = Offset(size.width * 0.25, size.height * 0.65);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.7);
    wavePath.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.75);
    var secondEndPoint = Offset(size.width, size.height * 0.7);
    wavePath.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();

    canvas.drawPath(
      wavePath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [mediumBlue.withOpacity(0.3), darkBlue.withOpacity(0.1)],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
