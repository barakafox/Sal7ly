import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sal7ly/Google_Maps/views/custom_google_map.dart';

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
        home: CustomGoogleMap()
      );
  }
}