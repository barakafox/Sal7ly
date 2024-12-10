import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceProviderProfile extends StatelessWidget {
  final Map<String, dynamic> index;
  ServiceProviderProfile({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(index['image']),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                index['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                '4.9 (96 reviews)',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Badge(text: '10+ Years'),
                Badge(text: '4.9 Rating'),
                Badge(text: '90+ Reviews'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'About The Electrical',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Experienced Electrical with over 10 years of expertise in residential and commercial Electring. I am dedicated to solving issues efficiently and providing high-quality service to all clients.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Skills & Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• Pipe Installation'),
            Text('• Leak Repairs'),
            Text('• Drain Cleaning'),
            Text('• Water Heater Maintenance'),
            Text('• Emergency Electring Repairs'),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle booking action
                },
                child: Text('Book The Electrical',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final String text;

  Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    List<String> words = text.split(' ');
    return Column(
      children: [
        Text(
          words[0],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          words.sublist(1).join(' '),
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}