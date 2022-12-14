import 'package:flutter/material.dart';
import 'package:halter/responsive/mobile_screen_layout.dart';
import 'package:halter/responsive/responsive_layout_screen.dart';
import 'package:halter/utils/colors.dart';

void main() {
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
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
      ),
    );
  }
}
