import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_keep_clone/view/home_screen.dart';
import 'package:google_keep_clone/view/login_screen.dart';
import 'package:google_keep_clone/view/splash_screen.dart';

const savekeyname = 'userloggedin';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
