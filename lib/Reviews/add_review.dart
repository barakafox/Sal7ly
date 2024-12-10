import 'package:flutter/material.dart';
import 'package:sal7ly/Reviews/review_page.dart';

class AddReviewPage extends StatefulWidget {
  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  double _rating = 0.0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewPage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Container for gradient background (as before)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade100, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Type your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.purple), // Apply purple border
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'How was your experience?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Normal TextField for experience with OutlineInputBorder
            TextField(
              controller: _experienceController,
              decoration: InputDecoration(
                hintText: 'Describe your experience',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.purple), // Apply purple border here
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            Text(
              'Star Rating',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _rating,
              onChanged: (newRating) {
                setState(() {
                  _rating = newRating;
                });
              },
              min: 0,
              max: 5,
              divisions: 5,
              label: _rating.toString(),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Submit review action
                },
                child: Text('Submit Review'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: Colors.blue, // Button color
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
