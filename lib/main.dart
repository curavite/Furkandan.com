import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_full_learn/pages/auth/register_page.dart';
import 'pages/auth/login_page.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "/register_page": (context) => register_page(),
        "/login_page": (context) => login_page(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const home_page(),
    );
  }
}
