import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Reviews/add_review.dart';

class PaintService extends StatelessWidget {
  final Map<String, dynamic> indexs;
  PaintService({required this.indexs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.add_comment),
            onPressed: () {
              // Navigate to the Add Review page (assuming you have this page)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddReviewPage()),  // Replace with your actual Add Review page
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(indexs['image']),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                indexs['name'],
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
              'About The Painter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Experienced Painter with over 10 years of expertise in residential and commercial painting. I am dedicated to solving issues efficiently and providing high-quality service to all clients.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Skills & Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• Wall Painting'),
            Text('• Ceiling Painting'),
            Text('• Interior & Exterior Painting'),
            Text('• Wood Finishing'),
            Text('• Emergency Painting Services'),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle booking action
                },
                child: Text('Book The Painter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
