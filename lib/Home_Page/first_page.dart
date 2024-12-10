import 'package:flutter/material.dart';
import 'package:sal7ly/Registeration/login.dart';

import '../Registeration/info_worker.dart';

void main() {
  runApp(FirstPage());
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Top purple circular pattern
            Positioned(
              top: -60,
              left: 430,
              child: Container(
                width: 180,
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
                width: 170,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.deepPurple, // Dark purple color
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Bottom purple circular pattern
            Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo and Text
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple[100],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                          size: 50,
                          color: Colors.purple,
                        ),
                        Text(
                          'Sal7ly',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'To explore and interact with all the features, please log in or sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Buttons
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.purple,
                      ),
                      icon: Icon(Icons.person, color: Colors.white),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'User',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPageWorker()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.purple,
                      ),
                      icon: Icon(Icons.work, color: Colors.white),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Worker',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
