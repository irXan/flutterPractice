import 'package:flutter/material.dart';
import 'package:myapp_01/profile_screen.dart';
import 'package:myapp_01/profile_screen2.dart';
import 'package:myapp_01/signin_screen.dart';
import 'package:myapp_01/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice',
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/profile': (context) => ProfileScreen(),
        '/profile2': (context) => ProfileScreenLevel2()
      },
    );
  }
}
