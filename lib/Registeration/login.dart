import 'package:flutter/material.dart';
import 'package:sal7ly/Registeration/sign_up.dart';
import '../Home_Page/homepage.dart';
import 'forget_password.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            // Circular background
            Positioned(
              top: -100,
              left: 400,
              child: Container(
                width: 180,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Login form
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, size: 50), // Placeholder for logo
                        Text(
                          'S A L 7 L Y',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFieldWithIcons(
                      icon: Icons.email_outlined,
                      hintText: 'Email or User Name',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email or username';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFieldWithIcons(
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sign in', style: TextStyle(color: Colors.white)),
                          Icon(Icons.arrow_right_alt),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Proceed with sign-in
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceApp()),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Or sign in With',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.g_mobiledata_sharp,
                              color: Colors.yellow),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.facebook, color: Colors.blue),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        'Don\'t have an account? Sign Up',
                        style: TextStyle(color: Colors.purple),
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
}

class TextFieldWithIcons extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  TextFieldWithIcons({
    required this.icon,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      validator: validator,
      obscureText: obscureText,
    );
  }
}
