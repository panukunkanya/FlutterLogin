import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String username;

  const WelcomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'), // กำหนดหัวเรื่องของ AppBar
          centerTitle: true, // จัดจากให้หัวเรื่องอยู่กึ่งกลาง
          backgroundColor: Colors.green, // ตั้งค่าสีพื้นหลังของ AppBar
        ),
        body: Center(
          child: Text(
            'Hi $username!', // แสดงข้อความต้อนรับพร้อมกับ username ที่ส่งมา
            style:
                const TextStyle(fontSize: 24.0), // กำหนดขนาดตัวอักษรของข้อความ
          ),
        ),
      ),
    );
  }
}
