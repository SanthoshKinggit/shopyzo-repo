import 'package:flutter/material.dart';
import 'package:myapp/homepage.dart';
import 'package:myapp/prime.dart';

class PinInputScreen extends StatefulWidget {
  @override
  _PinInputScreenState createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  final _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Your PIN',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w200,
            color: const Color.fromARGB(255, 68, 68, 68),
            fontFamily: 'Nunito',
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                'Add a PIN number to make your account more secure',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  color: const Color.fromARGB(255, 68, 68, 68),
                  fontFamily: 'Nunito',
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Secure your account with a 6-digit PIN',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
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
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Nunito',
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
                    ),
                  );
                }),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentApp()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
                      color: primary,
                      fontFamily: 'Nunito',
                      fontSize: 16,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }
}
