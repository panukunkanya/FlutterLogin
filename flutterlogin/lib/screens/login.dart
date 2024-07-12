import 'package:flutter/material.dart';
import 'package:flutterlogin/screens/emaillogin.dart';
import 'package:flutterlogin/screens/linelogin.dart';
import 'package:flutterlogin/screens/welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() =>
      _LoginPageState(); // สร้าง State สำหรับ LoginPage
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController =
      TextEditingController(); // ตัวควบคุม TextField สำหรับเบอร์โทรศัพท์
  final TextEditingController _passwordController =
      TextEditingController(); // ตัวควบคุม TextField สำหรับรหัสผ่าน
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // GlobalKey สำหรับ Form ในการตรวจสอบข้อมูล

  void _login() {
    if (_formKey.currentState!.validate()) {
      // ตรวจสอบความถูกต้องของข้อมูลที่ผู้ใช้ป้อน
      final phone =
          _phoneController.text; // ดึงข้อมูลเบอร์โทรศัพท์จาก TextField
      final password =
          _passwordController.text; // ดึงข้อมูล password จาก TextField
      print('Phone: $phone');
      print('Password: $password');
      // คุณสามารถทำการนำทางไปยังหน้าอื่นหรือแสดงข้อความได้ที่นี่
      _navigateToWelcome(
          phone); // เรียกใช้ฟังก์ชันเพื่อนำทางไปยังหน้า Welcome พร้อมส่งเบอร์โทรศัพท์ไปด้วย
    }
    _phoneController.clear();
    _passwordController.clear();
  }

  void _loginWithLine() {
    // โค้ดสำหรับการ Login ด้วย LINE
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LineLogin(),
      ),
    );
    print('Login with LINE');
  }

  void _loginWithEmail() {
    // โค้ดสำหรับการ Login ด้วย Email
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailLogin(),
      ),
    );
    print('Login with Email');
  }

  void _navigateToWelcome(String phone) {
    // ฟังก์ชันสำหรับการนำทางไปยังหน้า Welcome พร้อมส่งเบอร์โทรศัพท์ไปด้วย
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage(username: phone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Login'), // ตั้งค่าหัวเรื่อง AppBar
          centerTitle: true, // จัดจากให้หัวเรื่องอยู่กึ่งกลาง
          backgroundColor: Colors.red, // ตั้งค่าสีพื้นหลังของ AppBar
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
                        _phoneController, // กำหนด Controller สำหรับ TextField เบอร์โทรศัพท์
                    decoration: const InputDecoration(
                        labelText: 'Phone Number'), // กำหนดหัวข้อใน TextField
                    keyboardType: TextInputType
                        .phone, // กำหนดประเภทแป้นพิมพ์เป็นแบบตัวเลข
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number'; // ตรวจสอบว่า TextField ว่างหรือไม่
                      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Please enter a valid phone number'; // ตรวจสอบรูปแบบเบอร์โทรศัพท์ (ตัวอย่าง: ต้องมี 10 ตัวเลข)
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // จัดตำแหน่งปุ่มให้ห่างกันอย่างเท่าๆ กัน
                    children: [
                      ElevatedButton(
                        onPressed:
                            _loginWithLine, // กำหนดฟังก์ชันที่จะทำงานเมื่อกดปุ่ม
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.green, // กำหนดสีพื้นหลังของปุ่ม
                        ),
                        child: const Text(
                          ' LINE',
                          style: TextStyle(color: Colors.white),
                        ), // กำหนดข้อความบนปุ่ม
                      ),
                      ElevatedButton(
                        onPressed:
                            _loginWithEmail, // กำหนดฟังก์ชันที่จะทำงานเมื่อกดปุ่ม
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue, // กำหนดสีพื้นหลังของปุ่ม
                        ),
                        child: const Text(
                          ' Email',
                          style: TextStyle(color: Colors.white),
                        ), // กำหนดข้อความบนปุ่ม
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
