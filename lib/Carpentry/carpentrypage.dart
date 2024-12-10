import 'package:flutter/material.dart';
import 'package:sal7ly/Carpentry/info_page.dart';
import 'package:sal7ly/Conditioning_Service/info_condition.dart';



class CarpentryListPage extends StatelessWidget {
  final List<Map<String, String>> carpentrys = [
    {'name': 'Mohamed Ahmed', 'description': 'Carpentry', 'image': 'https://via.placeholder.com/150'},
    {'name': 'Ahmed Emad', 'description': 'Carpentry', 'image': 'https://via.placeholder.com/150'},
    {'name': 'Hassan Wael', 'description': 'Carpentry', 'image': 'https://via.placeholder.com/150'},
    {'name': 'Wael Hamza', 'description': 'Carpentry', 'image': 'https://via.placeholder.com/150'},
    {'name': 'Hassanin Ahmed', 'description': 'Carpentry', 'image': 'https://via.placeholder.com/150'},
    {'name': 'Abdo Hany', 'description': 'Carpentry', 'image': 'https://via.placeholder.com/150'},
    {'name': 'Ahmed Fares', 'description': 'Carpentry', 'image': 'https://via.placeholder.com/150'},
    {'name': 'Fares Abdo', 'description': 'Carpentry', 'image': 'https://via.placeholder.com/150'},
  ];

  // Define custom colors
  final Color purple = Color.fromRGBO(128, 0, 128, 1.0);
  final Color lightPurple = Color.fromRGBO(216, 191, 216, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Carpentry'),
        backgroundColor: purple, // Apply custom purple color
      ),
      body: Container(
        color: lightPurple, // Set background color of the entire page
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
          ),
          itemCount: carpentrys.length,
          itemBuilder: (context, index) {
            final carpentry = carpentrys[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarpentryService(indexs: carpentry),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(carpentry['image']!),
                        radius: 40,
                      ),
                      SizedBox(height: 8),
                      Text(carpentry['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(carpentry['description']!),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: purple, // Apply custom purple color
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
