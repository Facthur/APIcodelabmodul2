import 'package:flutter/material.dart';
import 'screens/api_data_screen.dart';  // Import layar yang menampilkan data API

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApiDataScreen(),  // Halaman utama
    );
  }
}

