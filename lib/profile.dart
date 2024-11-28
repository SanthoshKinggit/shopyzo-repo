// profile_screen.dart
// ignore_for_file: prefer_const_constructors, avoid_print, unused_field, use_super_parameters, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/homepage.dart';
import 'package:myapp/prime.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({Key? key}) : super(key: key);

  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _imageUrl;
  String? _fullName;
  String? _nickname;
  String? _email;
  String _countryCode = '+1';
  String? _phoneNumber;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageUrl = image.path;
      });
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Form submitted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Fill Your Profile',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () => Navigator.pop(context),
        ),
        // actions: [
        //   Card(
        //     color: Colors.blue[300],
        //     child: TextButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => PaymentApp()),
        //           );
        //         },
        //         child: Text(
        //           'Skip',
        //           style: TextStyle(
        //             fontSize: 14,
        //             fontFamily: 'Nunito',
        //             color: const Color.fromARGB(255, 255, 255, 255),
        //           ),
        //         )),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  // Profile Image
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: _imageUrl != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(_imageUrl!,
                                      fit: BoxFit.cover),
                                )
                              : const Icon(Icons.person,
                                  size: 50, color: Colors.grey),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: primary,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Form Fields
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(fontFamily: 'Nunito'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[50]!),
                      ),
                    ),
                    onSaved: (value) => _fullName = value,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Please enter your full name'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nickname',
                      labelStyle: TextStyle(fontFamily: 'Nunito'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[50]!),
                      ),
                    ),
                    onSaved: (value) => _nickname = value,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontFamily: 'Nunito'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[50]!),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => _email = value,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value!)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  // Phone Number with Country Code
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[50]!),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CountryCodePicker(
                          onChanged: (country) {
                            setState(() {
                              _countryCode = country.dialCode!;
                            });
                          },
                          initialSelection: 'US',
                          favorite: const ['US', 'UK'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(fontFamily: 'Nunito'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[50]!),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          onSaved: (value) => _phoneNumber = value,
                          validator: (value) => value?.isEmpty ?? true
                              ? 'Please enter your phone number'
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Continue Button
                  const Text(
                    "Don't worry, you can always change it later",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaymentApp()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
