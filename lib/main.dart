import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myapp_01/api/view.dart';

// import 'package:myapp_01/profiles/profile_screen.dart';
// import 'package:myapp_01/profiles/insta.dart';
// import 'package:myapp_01/auth/signin_screen.dart';
// import 'package:myapp_01/auth/signup_screen.dart';
// import 'package:myapp_01/provider/tasbihView.dart';

import 'package:myapp_01/provider/tasbih.dart';
import 'package:myapp_01/provider/theme_provider.dart';
import 'package:myapp_01/todo/todo.dart';
import 'package:myapp_01/todo/todo_details.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  await Hive.openBox('profile');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TasbihProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme_provider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: theme_provider.isDark ? ThemeMode.dark : ThemeMode.light,

      // initialRoute: '/',
      // routes: {
      //   '/': (context) => TasbihView(),
      //   '/signup': (context) => SignUpScreen(),
      //   '/profile': (context) => ProfileScreen(),
      //   '/insta': (context) => Insta(),
      //   '/todo': (context) => Todo(),
      //   '/to': (context) => TodoDetails(name: 'IRZAN', todos: []),
      // },
      
      home: MyView(),
    );
  }
}