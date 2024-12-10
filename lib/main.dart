import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sal7ly/Home_Page/map.dart';

import 'Home_Page/first_page.dart';
import 'Home_Page/homepage.dart';
import 'Reviews/review_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products',
        home: LocationPage(),
    );
  }
}