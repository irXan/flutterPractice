// import 'package:flutter/material.dart';
// import 'package:myapp_01/profile/profile_screen.dart';
// import 'package:myapp_01/profile/profile_screen2.dart';
// import 'package:myapp_01/auth/signin_screen.dart';
// import 'package:myapp_01/auth/signup_screen.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   await Hive.openBox();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Practice',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => SignInScreen(),
//         '/signup': (context) => SignUpScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/profile2': (context) => ProfileScreenLevel2(),
//       },
//     );
//   }
// }
