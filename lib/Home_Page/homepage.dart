import 'package:flutter/material.dart';
import 'package:sal7ly/Carpentry/carpentrypage.dart';
import 'package:sal7ly/Clean_Service/cleanpage.dart';
import 'package:sal7ly/Conditioning_Service/conditiopage.dart';
import 'package:sal7ly/Conditioning_Service/info_condition.dart';
import 'package:sal7ly/Plumber_Service/plumberpage.dart';

import '../Electrical_Service/electricpage.dart';
import '../Paint_Services/paintpage.dart';

void main() {
  runApp(ServiceApp());
}

class ServiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ServiceHomePage(),
    );
  }
}

class ServiceHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Home Page'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search services...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.purple, // Border color
                    width: 2, // Border width
                  ),
                ),
                child: Container(
                  width: double.infinity,
                    child: Icon(Icons.discount,)),
              ),
              SizedBox(height: 20),
              Text(
                'Choose the service',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    ServiceIcon(Icons.cleaning_services, 'Cleaning', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CLeanListPage()));
                    },),
                    ServiceIcon(Icons.build, 'Carpentry', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CarpentryListPage()));
                    },),
                    ServiceIcon(Icons.plumbing, 'Plumbing', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PlumberListPage()));
                    },),
                    ServiceIcon(Icons.ac_unit, 'Conditioning', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConditioListPage()));
                    },),
                    ServiceIcon(Icons.electrical_services, 'Electricity', onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ElectricianListPage()),
                      );
                    }),
                    ServiceIcon(Icons.format_paint, 'Paint', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaintListPage()));
                    },),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.stairs), label: 'Stability'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'My Order'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  ServiceIcon(this.icon, this.label, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.purple),
          SizedBox(height: 10),
          Text(label, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class ElectricityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electricity Services'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text(
          'Details about Electricity Services',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
