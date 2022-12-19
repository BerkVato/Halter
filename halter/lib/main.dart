import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:halter/responsive/mobile_screen_layout.dart';
import 'package:halter/responsive/responsive_layout_screen.dart';
import 'package:halter/screens/comment_screen.dart';
import 'package:halter/screens/login_screen.dart';
import 'package:halter/screens/profile_screen.dart';
import 'package:halter/screens/signup_screen.dart';
import 'package:halter/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halter',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      // mobileScreenLayout: MobileScreenLayout(),
      //   ),
      home: const CommentsScreen(),
    );
  }
}
