import 'package:flutter/material.dart';
import 'package:flutterlogin/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo', // กำหนดชื่อแอป
      theme: ThemeData(
        primarySwatch: Colors.blue, // กำหนดสีหลักของแอป
      ),
      home: const LoginPage(), // กำหนดหน้าแรกของแอปเป็น LoginPage
    );
  }
}
