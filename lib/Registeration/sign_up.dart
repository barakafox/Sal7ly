import 'package:flutter/material.dart';
import 'package:sal7ly/Registeration/login.dart';
import 'package:sal7ly/Home_Page/map.dart';

void main() {
  runApp(SignUpPage());
}

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            // Circular background
            Positioned(
              top: -60,
              left: 430,
              child: Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  color: Color(0xFF6A1B9A), // Dark purple color
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: 300,
              child: Container(
                width: 190,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.deepPurple, // Dark purple color
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Sign-up form
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFieldWithIcon(
                      icon: Icons.person_outline,
                      hintText: 'Full name',
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFieldWithIcon(
                      icon: Icons.email_outlined,
                      hintText: 'Email',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFieldWithIcon(
                      icon: Icons.lock_outline,
                      hintText: 'Password',
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFieldWithIcon(
                      icon: Icons.lock_outline,
                      hintText: 'Confirm password',
                      controller: confirmPasswordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFieldWithIcon(
                      icon: Icons.home_outlined,
                      hintText: 'Address',
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null; // Return null if valid
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocationPage()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process data
                        }
                      },
                      child: Text('Sign Up'),
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
}

class TextFieldWithIcon extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onTap; // Add onTap parameter

  TextFieldWithIcon({
    required this.icon,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.onTap, // Initialize onTap
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Added border radius
        ),
      ),
      validator: validator,
      onTap: onTap, // Use the onTap function
    );
  }
}