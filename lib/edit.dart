// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/homepage.dart';
import 'package:myapp/prime.dart';
import 'package:myapp/profileedit.dart';
import 'package:myapp/qrcode.dart';
import 'package:myapp/qrscan.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  bool isDarkMode = false;
  String selectedLanguage = 'English (US)';

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PaymentApp()));
        setState(() {});
        break;
      case 1:
        setState(() {});
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QRScannerPage()),
        );
        setState(() {});

        break;
      case 3:
        if (index == 3) {
          print('object');
        } else if (index == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PaymentApp()));
        } else if (index == 1) {
        } else if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const QRScannerPage()));
        } else if (index == 3) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProfileSettingsScreen()));
        } else {
          print('object');
        }
        setState(() {});
        break;
      case 4:
        if (index == 4) {
          setState(() {});
        }
        setState(() {});
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(width: 14),
            const Text(
              '                Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.qr_code_2_outlined,
              size: 44,
              color: primary,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Qrcode()));
            },
          ),
          SizedBox(
            width: 4,
          )
        ],
      ),
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            const SizedBox(height: 24),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/logo/cropped_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                         Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color:  primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Andrew Ainsley',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'andrew_ainsley@yourdomain.com',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 32),
            _buildSettingItem(
              icon: Icons.person_outline,
              title: 'Edit Profile',
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
              },
              showArrow: true,
            ),
            _buildSettingItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {},
              showArrow: true,
            ),
            _buildSettingItem(
              icon: Icons.language_outlined,
              title: 'Language',
              value: selectedLanguage,
              onTap: () => _showLanguageBottomSheet(),
              showArrow: true,
            ),
            _buildSettingItem(
              icon: Icons.security_outlined,
              title: 'Security',
              onTap: () {},
              showArrow: true,
            ),
            _buildSettingItem(
              icon: CupertinoIcons.moon,
              title: 'Dark Theme',
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                activeColor: primary,
              ),
              onTap: () {},
            ),
            _buildSettingItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              onTap: () {},
              showArrow: true,
            ),
            _buildSettingItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {},
              showArrow: true,
            ),
            _buildSettingItem(
              icon: Icons.contact_support_outlined,
              title: 'Contact Us',
              onTap: () {},
              showArrow: true,
            ),
            _buildSettingItem(
              icon: Icons.logout,
              title: 'Logout',
              titleColor: Colors.red,
              onTap: () => _showLogoutDialog(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
          ),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: 'Account'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                        )),
                  ],
                ),
                label: 'Scan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_repair_service), label: 'Services'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? value,
    required Function() onTap,
    Color? titleColor,
    Widget? trailing,
    bool showArrow = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey[600],
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.black87,
          fontSize: 16,
          fontFamily: 'Inter',
        ),
      ),
      trailing: trailing ??
          (showArrow
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (value != null)
                      Text(
                        value,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    if (value != null) const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                      size: 16,
                    ),
                  ],
                )
              : null),
      onTap: onTap,
    );
  }

  void _showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Language',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('English (US)'),
                trailing: selectedLanguage == 'English (US)'
                    ? const Icon(
                        Icons.check,
                        color: primary,
                      )
                    : null,
                onTap: () {
                  setState(() {
                    selectedLanguage = 'English (US)';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Spanish'),
                trailing: selectedLanguage == 'Spanish'
                    ? const Icon(
                        Icons.check,
                        color: primary,
                      )
                    : null,
                onTap: () {
                  setState(() {
                    selectedLanguage = 'Spanish';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement logout logic here
              Navigator.pop(context);
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
