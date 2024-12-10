import 'package:flutter/material.dart';

import 'add_review.dart';

class ReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {'name': 'Mohamed', 'rating': 4.8, 'comment': 'I highly recommend this worker! They work so hard.'},
    {'name': 'Osama', 'rating': 4.8, 'comment': 'Mohamed el sayed was quick to respond and fixed our issue on the same day. Highly recommend!'},
    {'name': 'Zyad', 'rating': 4.8, 'comment': 'I highly recommend this worker! They work so hard.'},
    {'name': 'Hassan', 'rating': 4.8, 'comment': 'I highly recommend this worker! They work so hard.'},
    {'name': 'Amar', 'rating': 4.8, 'comment': 'I highly recommend this worker! They work so hard.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(reviews[index]['name'][0]),
                ),
                title: Text(reviews[index]['name']),
                subtitle: Text(reviews[index]['comment']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      starIndex < reviews[index]['rating'] ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddReviewPage()));
        },
        label: Text('Add Review'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
