import 'package:flutter/material.dart';
import 'package:flutterlogin/screens/welcome.dart';

class LineLogin extends StatefulWidget {
  const LineLogin({super.key});

  @override
  State<LineLogin> createState() => _LineLoginState();
}

class _LineLoginState extends State<LineLogin> {
  final TextEditingController _usernameController =
      TextEditingController(); // ตัวควบคุม TextField สำหรับชื่อผู้ใช้
  final TextEditingController _passwordController =
      TextEditingController(); // ตัวควบคุม TextField สำหรับรหัสผ่าน
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // GlobalKey สำหรับ Form ในการตรวจสอบข้อมูล

  void _login() {
    if (_formKey.currentState!.validate()) {
      // ตรวจสอบความถูกต้องของข้อมูลที่ผู้ใช้ป้อน
      final username =
          _usernameController.text; // ดึงข้อมูล username จาก TextField
      final password =
          _passwordController.text; // ดึงข้อมูล password จาก TextField
      print('Username: $username');
      print('Password: $password');
      // คุณสามารถทำการนำทางไปยังหน้าอื่นหรือแสดงข้อความได้ที่นี่
      _navigateToWelcome(
          username); // เรียกใช้ฟังก์ชันเพื่อนำทางไปยังหน้า Welcome พร้อมส่ง username ไปด้วย
    }
    //_formKey.currentState!.reset();
    _usernameController.clear();
    _passwordController.clear();
  }

  void _navigateToWelcome(String username) {
    // ฟังก์ชันสำหรับการนำทางไปยังหน้า Welcome พร้อมส่ง username ไปด้วย
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage(username: username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Line Login'), // กำหนดหัวเรื่องของ AppBar
          centerTitle: true, // จัดจากให้หัวเรื่องอยู่กึ่งกลาง
          backgroundColor: Colors.green, // ตั้งค่าสีพื้นหลังของ AppBar
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // กำหนด GlobalKey สำหรับ Form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 32.0), // สร้างช่องว่างด้านบน
                  TextFormField(
                    controller:
                        _usernameController, // กำหนด Controller สำหรับ TextField ชื่อผู้ใช้
                    decoration: const InputDecoration(
                        labelText: 'Line E-mail'), // กำหนดหัวข้อใน TextField
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Line E-mail'; // ตรวจสอบว่า TextField ว่างหรือไม่
                      }
                      return null; // ผ่านการตรวจสอบ
                    },
                  ),
                  const SizedBox(
                      height: 16.0), // สร้างช่องว่างห่างระหว่าง TextField
                  TextFormField(
                    controller:
                        _passwordController, // กำหนด Controller สำหรับ TextField รหัสผ่าน
                    decoration: const InputDecoration(
                        labelText: 'Password'), // กำหนดหัวข้อใน TextField
                    obscureText: true, // ทำให้เป็นรหัสผ่านแบบซ่อน
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password'; // ตรวจสอบว่า TextField ว่างหรือไม่
                      }
                      return null; // ผ่านการตรวจสอบ
                    },
                  ),
                  const SizedBox(
                      height:
                          32.0), // สร้างช่องว่างห่างระหว่าง TextField กับปุ่ม
                  ElevatedButton(
                    onPressed: _login, // กำหนดฟังก์ชันที่จะทำงานเมื่อกดปุ่ม
                    child: const Text('Login'), // กำหนดข้อความบนปุ่ม
                  ),
                  const SizedBox(
                      height:
                          32.0), // สร้างช่องว่างห่างระหว่างปุ่ม Login กับปุ่มอื่นๆ
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
