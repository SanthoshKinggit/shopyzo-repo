// Suggested code may be subject to a license. Learn more: ~LicenseLog:379606062.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1451730466.
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, use_build_context_synchronously, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last, unused_import, avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/homepage.dart';
import 'package:myapp/person.dart';
import 'package:myapp/prime.dart';
import 'package:myapp/splashscreen.dart';
import 'package:myapp/step.dart';

class UserTypeSelection extends StatefulWidget {
  const UserTypeSelection({super.key});

  @override
  _UserTypeSelectionState createState() => _UserTypeSelectionState();
}

class _UserTypeSelectionState extends State<UserTypeSelection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _selectedIndex = -1;

  final List<UserTypeItem> _userTypes = [
    UserTypeItem(
      title: 'Customer',
      icon: Icons.person,
      description: 'Browse and purchase products',
      fontFamily: 'Poppins',
      backgroundColor: const Color.fromARGB(255, 148, 193, 226),
      iconColor: Colors.blue,
      destination: CustomerRegistrationForm(),
      iconSize: 33,
    ),
    UserTypeItem(
      title: 'Vendor',
      icon: Icons.store_rounded,
      description: 'Sell products and manage inventory',
      backgroundColor: const Color.fromARGB(255, 149, 255, 152),
      iconColor: Colors.green,
      destination: VendorRegistrationForm(),
      fontFamily: 'Poppins',
      iconSize: 33,
    ),
    UserTypeItem(
      title: 'Francis',
      icon: Icons.admin_panel_settings,
      description: 'System administration and management',
      backgroundColor: const Color.fromARGB(255, 255, 227, 143),
      iconColor: const Color.fromARGB(255, 226, 170, 0),
      destination: FranchiseeRegistrationForm(),
      fontFamily: 'Poppins',
      iconSize: 50,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToDestination(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Add a slight delay for the selection animation
    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _userTypes[index].destination,
        ),
      );
    });
  }

  Widget _buildUserTypeCard(int index) {
    final userType = _userTypes[index];
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _navigateToDestination(context, index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? userType.backgroundColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(
            color: isSelected ? userType.iconColor : Colors.grey.shade200,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? userType.iconColor.withOpacity(0.2)
                    : userType.backgroundColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                userType.icon,
                color: userType.iconColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userType.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: userType.fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userType.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: userType.fontFamily,
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: isSelected ? userType.iconColor : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: const Color.fromARGB(255, 230, 244, 253),
          centerTitle: true,
          title: Text(
            'Select User Type',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 52, 55, 68),
              letterSpacing: 0.5,
              shadows: [
                Shadow(
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
          )),
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      body: SafeArea(
        child: Stack(
          children: [
            const WaveBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Colors.deepPurple,
                      const Color.fromARGB(255, 158, 113, 238)
                    ],
                  ).createShader(bounds),
                  child: Text(
                    'Choose your role in the application',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Center(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _userTypes.length,
                      itemBuilder: (context, index) {
                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 400 + (index * 100)),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(0, 50 * (1 - value)),
                              child: Opacity(
                                opacity: value,
                                child: _buildUserTypeCard(index),
                              ),
                            );
                          },
                        );
                      },
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

class UserTypeItem {
  final String title;
  final IconData icon;
  final String description;
  final Color backgroundColor;
  final Color iconColor;
  final Widget destination;
  final String fontFamily;
  final double iconSize;

  // Added iconSize for controlling the icon size

  // Constructor with all parameters, including the iconSize
  UserTypeItem({
    required this.title,
    required this.icon,
    required this.description,
    required this.backgroundColor,
    required this.iconColor,
    required this.destination,
    required this.fontFamily,
    required this.iconSize, // Added iconSize parameter here
  });
}

class _UserTypeIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Widget destination;

  const _UserTypeIcon({
    required this.icon,
    required this.label,
    required this.color,
    required this.destination,
  });

  @override
  State<_UserTypeIcon> createState() => _UserTypeIconState();
}

class _UserTypeIconState extends State<_UserTypeIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.destination,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: widget.label,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.6),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                widget.icon,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final TextInputFormatter? inputFormatter;
  final String Function(String?) validator;
  final int? maxLines;

  CustomTextField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.inputFormatter,
    required this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatter != null ? [inputFormatter!] : [],
      validator: validator,
      maxLines: maxLines,
    );
  }
}

class CustomerRegistrationForm extends StatefulWidget {
  @override
  _CustomerRegistrationFormState createState() =>
      _CustomerRegistrationFormState();
}

class _CustomerRegistrationFormState extends State<CustomerRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Personal Details Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  // Contact Details Controllers
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  // Additional Details Controllers
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _incomeRangeController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();

  // Expansion state for sections
  bool _isPersonalDetailsExpanded = true;
  bool _isContactDetailsExpanded = false;
  bool _isAdditionalDetailsExpanded = false;

  // Gender selection
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  String? selectedGender;

  // Income range options
  List<String> incomeRangeOptions = [
    'Below 2,00,000',
    '2,00,000 - 5,00,000',
    '5,00,000 - 10,00,000',
    'Above 10,00,000'
  ];
  String? selectedIncomeRange;

  // Education options
  List<String> educationOptions = [
    'High School',
    'Graduate',
    'Post Graduate',
    'Professional Degree',
    'Other'
  ];
  String? selectedEducation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserTypeSelection()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
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
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: ListView(
                  children: [
                    // Personal Details Section
                    _buildExpandableSection(
                      color: const Color.fromARGB(255, 19, 149, 255),
                      titleColor: Colors.white,
                      title: 'Personal Details',
                      isExpanded: _isPersonalDetailsExpanded,
                      onTap: () {
                        setState(() {
                          _isPersonalDetailsExpanded =
                              !_isPersonalDetailsExpanded;
                          // Close other sections
                          _isContactDetailsExpanded = false;
                          _isAdditionalDetailsExpanded = false;
                        });
                      },
                      child: _buildPersonalDetailsForm(),
                    ),

                    const SizedBox(height: 16),

                    // Contact Details Section
                    _buildExpandableSection(
                      color: Colors.blue,
                      titleColor: Colors.white,
                      title: 'Contact Details',
                      isExpanded: _isContactDetailsExpanded,
                      onTap: () {
                        setState(() {
                          _isContactDetailsExpanded =
                              !_isContactDetailsExpanded;
                          // Close other sections
                          _isPersonalDetailsExpanded = false;
                          _isAdditionalDetailsExpanded = false;
                        });
                      },
                      child: _buildContactDetailsForm(),
                    ),

                    const SizedBox(height: 16),

                    // Additional Details Section
                    _buildExpandableSection(
                      color: Colors.blue,
                      titleColor: Colors.white,
                      title: 'Additional Details',
                      isExpanded: _isAdditionalDetailsExpanded,
                      onTap: () {
                        setState(() {
                          _isAdditionalDetailsExpanded =
                              !_isAdditionalDetailsExpanded;
                          // Close other sections
                          _isPersonalDetailsExpanded = false;
                          _isContactDetailsExpanded = false;
                        });
                      },
                      child: _buildAdditionalDetailsForm(),
                    ),

                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Expandable Section Widget
  Widget _buildExpandableSection({
    required String title,
    required Color titleColor,
    required bool isExpanded,
    required VoidCallback onTap,
    required Widget child,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: color, // Use the provided color here
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: titleColor, // Use the provided title color
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.blue,
            ),
            onTap: onTap,
          ),
          if (isExpanded) child,
        ],
      ),
    );
  }

  // Personal Details Form
  Widget _buildPersonalDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(
            controller: _nameController,
            hintText: 'Full Name',
            icon: Icons.person,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            hintText: 'Email Address',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _phoneController,
            hintText: 'Phone Number',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          _buildDateField(
            controller: _dobController,
            hintText: 'Date of Birth',
            icon: Icons.calendar_today,
          ),
          const SizedBox(height: 16),
          _buildDropdownField(
            value: selectedGender,
            color: Colors.black,
            hintText: 'Gender',
            icon: Icons.person_outline,
            items: genderOptions,
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // Contact Details Form
  Widget _buildContactDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(
            controller: _addressController,
            hintText: 'Full Address',
            icon: Icons.location_on,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _cityController,
            hintText: 'City',
            icon: Icons.location_city,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _stateController,
            hintText: 'State',
            icon: Icons.map,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _pinCodeController,
            hintText: 'PIN Code',
            icon: Icons.post_add,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }

  // Additional Details Form
  Widget _buildAdditionalDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(
              controller: _occupationController,
              hintText: 'Occupation',
              icon: Icons.work,
              color: Colors.black),
          const SizedBox(height: 16),
          _buildDropdownField(
            value: selectedIncomeRange,
            hintText: 'Income Range',
            icon: Icons.attach_money,
            color: Colors.black,
            items: incomeRangeOptions,
            onChanged: (value) {
              setState(() {
                selectedIncomeRange = value;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildDropdownField(
            value: selectedEducation,
            hintText: 'Education',
            icon: Icons.school,
            color: Colors.black,
            items: educationOptions,
            onChanged: (value) {
              setState(() {
                selectedEducation = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // Reusable TextField Widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    Color color = Colors.blue, // Added color property
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 16,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // Date Field Widget
  Widget _buildDateField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          setState(() {
            controller.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          });
        }
      },
    );
  }

  // Dropdown Field Widget
  Widget _buildDropdownField({
    required String? value,
    required String hintText,
    required IconData icon,
    required List<String> items,
    required void Function(String?) onChanged,
    required Color color,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }

  // Form Submission Method
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Validate and process form data
      print('Personal Details:');
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Phone: ${_phoneController.text}');
      print('DOB: ${_dobController.text}');
      print('Gender: $selectedGender');

      print('\nContact Details:');
      print('Address: ${_addressController.text}');
      print('City: ${_cityController.text}');
      print('State: ${_stateController.text}');
      print('PIN Code: ${_pinCodeController.text}');

      print('\nAdditional Details:');
      print('Occupation: ${_occupationController.text}');
      print('Income Range: $selectedIncomeRange');
      print('Education: $selectedEducation');

      // Navigate to Payment screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PaymentApp()),
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Customer Registration Submitted')),
      );
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pinCodeController.dispose();
    _occupationController.dispose();
    super.dispose();
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

class WaveBackground2 extends StatelessWidget {
  const WaveBackground2({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavePainter2(),
      child: Container(),
    );
  }
}

class WavePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define colors
    final lightBlue = Color.fromARGB(255, 255, 252, 241);
    final mediumBlue = Color.fromARGB(255, 255, 255, 255);
    final darkBlue = Color.fromARGB(255, 255, 193, 24);

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

class VendorRegistrationForm extends StatefulWidget {
  @override
  _VendorRegistrationFormState createState() => _VendorRegistrationFormState();
}

class _VendorRegistrationFormState extends State<VendorRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Business Details Controllers
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _panController = TextEditingController();

  // Business Contact Details Controllers
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  // Additional Business Details Controllers
  final TextEditingController _incorporationDateController =
      TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _annualTurnoverController =
      TextEditingController();

  // Expansion state for sections
  bool _isBusinessDetailsExpanded = true;
  bool _isContactDetailsExpanded = false;
  bool _isAdditionalDetailsExpanded = false;

  // Business Type options
  List<String> businessTypeOptions = [
    'Sole Proprietorship',
    'Partnership',
    'Private Limited',
    'Public Limited',
    'LLP'
  ];
  String? selectedBusinessType;

  // Annual Turnover options
  List<String> annualTurnoverOptions = [
    'Below 10,00,000',
    '10,00,000 - 50,00,000',
    '50,00,000 - 1,00,00,000',
    'Above 1,00,00,000'
  ];
  String? selectedAnnualTurnover;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MPINEntryPage()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
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
          'Vendor Registration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            const WaveBackground3(),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: ListView(
                  children: [
                    // Business Details Section
                    _buildExpandableSection(
                      title: 'Business Details',
                      isExpanded: _isBusinessDetailsExpanded,
                      onTap: () {
                        setState(() {
                          _isBusinessDetailsExpanded =
                              !_isBusinessDetailsExpanded;
                          // Close other sections
                          _isContactDetailsExpanded = false;
                          _isAdditionalDetailsExpanded = false;
                        });
                      },
                      child: _buildBusinessDetailsForm(),
                    ),

                    const SizedBox(height: 16),

                    // Contact Details Section
                    _buildExpandableSection(
                      title: 'Contact Details',
                      isExpanded: _isContactDetailsExpanded,
                      onTap: () {
                        setState(() {
                          _isContactDetailsExpanded =
                              !_isContactDetailsExpanded;
                          // Close other sections
                          _isBusinessDetailsExpanded = false;
                          _isAdditionalDetailsExpanded = false;
                        });
                      },
                      child: _buildContactDetailsForm(),
                    ),

                    const SizedBox(height: 16),

                    // Additional Details Section
                    _buildExpandableSection(
                      title: 'Additional Details',
                      isExpanded: _isAdditionalDetailsExpanded,
                      onTap: () {
                        setState(() {
                          _isAdditionalDetailsExpanded =
                              !_isAdditionalDetailsExpanded;
                          // Close other sections
                          _isBusinessDetailsExpanded = false;
                          _isContactDetailsExpanded = false;
                        });
                      },
                      child: _buildAdditionalDetailsForm(),
                    ),

                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentApp()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Expandable Section Widget (same as in customer registration)
  Widget _buildExpandableSection({
    required String title,
    Color titleColor = Colors.green,
    required bool isExpanded,
    required VoidCallback onTap,
    required Widget child,
    Color color = Colors.green, // Default color to green
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.green,
            ),
            onTap: onTap,
          ),
          if (isExpanded) child,
        ],
      ),
    );
  }

  // Business Details Form
  Widget _buildBusinessDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(
              controller: _businessNameController,
              hintText: 'Business Name',
              icon: Icons.business,
              color: Colors.black),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            hintText: 'Business Email',
            icon: Icons.email,
            color: Colors.black,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _phoneController,
            hintText: 'Business Phone Number',
            icon: Icons.phone,
            color: Colors.black,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _gstController,
            color: Colors.black,
            hintText: 'GST Number',
            icon: Icons.numbers,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _panController,
            color: Colors.black,
            hintText: 'PAN Number',
            icon: Icons.credit_card,
          ),
        ],
      ),
    );
  }

  // Contact Details Form
  Widget _buildContactDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(
            controller: _addressController,
            hintText: 'Business Address',
            icon: Icons.location_on,
            color: Colors.black,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _cityController,
            hintText: 'City',
            icon: Icons.location_city,
            color: Colors.black,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _stateController,
            hintText: 'State',
            icon: Icons.map,
            color: Colors.black,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _pinCodeController,
            hintText: 'PIN Code',
            icon: Icons.post_add,
            color: Colors.black,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }

  // Additional Details Form
  Widget _buildAdditionalDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildDateField(
            controller: _incorporationDateController,
            hintText: 'Incorporation Date',
            icon: Icons.calendar_today,
          ),
          const SizedBox(height: 16),
          _buildDropdownField(
            value: selectedBusinessType,
            hintText: 'Business Type',
            icon: Icons.business_center,
            items: businessTypeOptions,
            onChanged: (value) {
              setState(() {
                selectedBusinessType = value;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildDropdownField(
            value: selectedAnnualTurnover,
            hintText: 'Annual Turnover',
            icon: Icons.attach_money,
            items: annualTurnoverOptions,
            onChanged: (value) {
              setState(() {
                selectedAnnualTurnover = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // Reusable TextField Widget (same as in customer registration)
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    required Color color,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontSize: 16,
        ),
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 162, 255, 159),
      ),
    );
  }

  // Date Field Widget (same as in customer registration)
  Widget _buildDateField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          setState(() {
            controller.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          });
        }
      },
    );
  }

  // down Field Widget (same as in customer registration)
  Widget _buildDropdownField({
    required String? value,
    required String hintText,
    required IconData icon,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }

  // Form Submission Method
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Validate and process form data
      print('Business Details:');
      print('Business Name: ${_businessNameController.text}');
      print('Email: ${_emailController.text}');
      print('Phone: ${_phoneController.text}');
      print('GST Number: ${_gstController.text}');
      print('PAN Number: ${_panController.text}');

      print('\nContact Details:');
      print('Address: ${_addressController.text}');
      print('City: ${_cityController.text}');
      print('State: ${_stateController.text}');
      print('PIN Code: ${_pinCodeController.text}');

      print('\nAdditional Details:');
      print('Incorporation Date: ${_incorporationDateController.text}');
      print('Business Type: $selectedBusinessType');
      print('Annual Turnover: $selectedAnnualTurnover');

      // Navigate to next screen or process registration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vendor Registration Submitted')),
      );
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    _businessNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _gstController.dispose();
    _panController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pinCodeController.dispose();
    _incorporationDateController.dispose();
    super.dispose();
  }
}

class WaveBackground3 extends StatelessWidget {
  const WaveBackground3({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavePainter3(),
      child: Container(),
    );
  }
}

class WavePainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define colors
    final lightBlue = Color.fromARGB(255, 241, 255, 241);
    final mediumBlue = Color.fromARGB(255, 255, 255, 255);
    final darkBlue = Color.fromARGB(255, 30, 255, 0);
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

class WaveBackground extends StatelessWidget {
  const WaveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: CustomPaint(
        size: const Size(double.infinity, 300), // Adjust height as needed
        painter: WavePainter(),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // First wave
    final paint1 = Paint()
      ..color = primary.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final path1 = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.55,
        size.width * 0.5,
        size.height * 0.7,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.85,
        size.width,
        size.height * 0.7,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path1, paint1);

    // Second wave
    final paint2 = Paint()
      ..color = primary.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final path2 = Path()
      ..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.65,
        size.width * 0.5,
        size.height * 0.8,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.95,
        size.width,
        size.height * 0.8,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path2, paint2);

    // Third wave
    final paint3 = Paint()
      ..color = primary.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final path3 = Path()
      ..moveTo(0, size.height * 0.9)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.75,
        size.width * 0.5,
        size.height * 0.9,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 1.05,
        size.width,
        size.height * 0.9,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class FranchiseeRegistrationForm extends StatefulWidget {
  @override
  _FranchiseeRegistrationFormState createState() =>
      _FranchiseeRegistrationFormState();
}

class _FranchiseeRegistrationFormState
    extends State<FranchiseeRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Personal Details Controllers
  final TextEditingController _franchiseeNameController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Accounting Details Controllers
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _taxIdController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  // Business Details Controllers
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessAddressController =
      TextEditingController();
  final TextEditingController _businessPhoneController =
      TextEditingController();

  // Expansion state for sections
  bool _isPersonalDetailsExpanded = true;
  bool _isAccountingDetailsExpanded = false;
  bool _isBusinessDetailsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserTypeSelection()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
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
          'Franchisee Registration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            const WaveBackground2(),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: ListView(
                  children: [
                    // Personal Details Section
                    _buildExpandableSection(
                      title: 'Personal Details',
                      isExpanded: _isPersonalDetailsExpanded,
                      onTap: () {
                        setState(() {
                          _isPersonalDetailsExpanded =
                              !_isPersonalDetailsExpanded;
                          // Close other sections
                          _isAccountingDetailsExpanded = false;
                          _isBusinessDetailsExpanded = false;
                        });
                      },
                      child: _buildPersonalDetailsForm(),
                    ),

                    const SizedBox(height: 16),

                    // Accounting Details Section
                    _buildExpandableSection(
                      title: 'Accounting Details',
                      isExpanded: _isAccountingDetailsExpanded,
                      onTap: () {
                        setState(() {
                          _isAccountingDetailsExpanded =
                              !_isAccountingDetailsExpanded;
                          // Close other sections
                          _isPersonalDetailsExpanded = false;
                          _isBusinessDetailsExpanded = false;
                        });
                      },
                      child: _buildAccountingDetailsForm(),
                    ),

                    const SizedBox(height: 16),

                    // Business Details Section
                    _buildExpandableSection(
                      title: 'Business Details',
                      isExpanded: _isBusinessDetailsExpanded,
                      onTap: () {
                        setState(() {
                          _isBusinessDetailsExpanded =
                              !_isBusinessDetailsExpanded;
                          // Close other sections
                          _isPersonalDetailsExpanded = false;
                          _isAccountingDetailsExpanded = false;
                        });
                      },
                      child: _buildBusinessDetailsForm(),
                    ),

                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Expandable Section Widget
  Widget _buildExpandableSection({
    required String title,
    Color titleColor = Colors.orange,
    required bool isExpanded,
    required VoidCallback onTap,
    required Widget child,
    Color color = Colors.orange, // Default color to orange
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.orange,
            ),
            onTap: onTap,
          ),
          if (isExpanded) child,
        ],
      ),
    );
  }

  // Personal Details Form
  Widget _buildPersonalDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(
            controller: _franchiseeNameController,
            hintText: 'Franchisee Name',
            color: Colors.black,
            icon: Icons.person,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            hintText: 'Email Address',
            icon: Icons.email,
            color: Colors.black,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _phoneController,
            hintText: 'Phone Number',
            icon: Icons.phone,
            color: Colors.black,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          _buildTextField(
              controller: _addressController,
              hintText: 'Personal Address',
              icon: Icons.location_on,
              color: Colors.black),
        ],
      ),
    );
  }

  // Accounting Details Form
  Widget _buildAccountingDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(
              controller: _companyNameController,
              hintText: 'Company Name',
              icon: Icons.business,
              color: Colors.black),
          const SizedBox(height: 16),
          _buildTextField(
              controller: _taxIdController,
              hintText: 'Tax ID / GST Number',
              icon: Icons.numbers,
              color: Colors.black),
          const SizedBox(height: 16),
          _buildTextField(
              controller: _accountNumberController,
              hintText: 'Bank Account Number',
              icon: Icons.account_balance,
              keyboardType: TextInputType.number,
              color: Colors.black),
        ],
      ),
    );
  }

  // Business Details Form
  Widget _buildBusinessDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTextField(
              controller: _businessNameController,
              hintText: 'Business Name',
              icon: Icons.storefront,
              color: Colors.black),
          const SizedBox(height: 16),
          _buildTextField(
              controller: _businessAddressController,
              hintText: 'Business Address',
              icon: Icons.location_city,
              color: Colors.black),
          const SizedBox(height: 16),
          _buildTextField(
              controller: _businessPhoneController,
              hintText: 'Business Phone Number',
              icon: Icons.business,
              keyboardType: TextInputType.phone,
              color: Colors.black),
        ],
      ),
    );
  }

  // Reusable TextField Widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required Color color,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontSize: 16,
        ),
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // Form Submission Method
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Validate and process form data
      print('Personal Details:');
      print('Name: ${_franchiseeNameController.text}');
      print('Email: ${_emailController.text}');
      print('Phone: ${_phoneController.text}');
      print('Address: ${_addressController.text}');

      print('\nAccounting Details:');
      print('Company Name: ${_companyNameController.text}');
      print('Tax ID: ${_taxIdController.text}');
      print('Account Number: ${_accountNumberController.text}');

      print('\nBusiness Details:');
      print('Business Name: ${_businessNameController.text}');
      print('Business Address: ${_businessAddressController.text}');
      print('Business Phone: ${_businessPhoneController.text}');

      // Navigate to Payment screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PaymentApp()),
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Franchisee Registration Submitted')),
      );
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    _franchiseeNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _companyNameController.dispose();
    _taxIdController.dispose();
    _accountNumberController.dispose();
    _businessNameController.dispose();
    _businessAddressController.dispose();
    _businessPhoneController.dispose();
    super.dispose();
  }
}

  // Widget _buildUserTypeCard(int index) {
  //   final userType = _userTypes[index];
  //   final isSelected = _selectedIndex == index;

  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         _selectedIndex = index;
  //       });
  //       // Add your navigation or selection logic here
  //     },
  //     child: AnimatedContainer(
  //       duration: const Duration(milliseconds: 300),
  //       margin: const EdgeInsets.only(bottom: 16),
  //       padding: const EdgeInsets.all(20),
  //       decoration: BoxDecoration(
  //         color: isSelected ? userType.backgroundColor : Colors.white,
  //         borderRadius: BorderRadius.circular(16),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(0.05),
  //             blurRadius: 10,
  //             offset: const Offset(0, 5),
  //           ),
  //         ],
  //         border: Border.all(
  //           color: isSelected ? userType.iconColor : Colors.grey.shade200,
  //           width: 2,
  //         ),
  //       ),
  //       child: Row(
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.all(12),
  //             decoration: BoxDecoration(
  //               color: isSelected
  //                   ? userType.iconColor.withOpacity(0.2)
  //                   : userType.backgroundColor.withOpacity(0.2),
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //             child: Icon(
  //               userType.icon,
  //               color: userType.iconColor,
  //               size: 28,
  //             ),
  //           ),
  //           const SizedBox(width: 16),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   userType.title,
  //                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                 ),
  //                 const SizedBox(height: 4),
  //                 Text(
  //                   userType.description,
  //                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
  //                         color: Colors.grey[600],
  //                       ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Icon(
  //             Icons.chevron_right,
  //             color: isSelected ? userType.iconColor : Colors.grey,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }