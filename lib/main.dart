import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myapp_01/api/view.dart';
import 'package:myapp_01/profiles/profile_screen.dart';
import 'package:myapp_01/profiles/insta.dart';
// import 'package:myapp_01/auth/signin_screen.dart';
import 'package:myapp_01/auth/signup_screen.dart';
// import 'package:hive/hive.dart';
import 'package:myapp_01/todo/todo.dart';
import 'package:myapp_01/todo/todo_details.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await Hive.openBox('profile');

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
        '/': (context) => MyView(),
        '/signup': (context) => SignUpScreen(),
        '/profile': (context) => ProfileScreen(),
        '/insta': (context) => Insta(),
        '/todo': (context) => Todo(),
        '/to': (context) => TodoDetails(name: 'IRZAN', todos: [])
      },
      // home: MyView(),
    );
  }
}