import 'package:flutter/material.dart';

import '../utils/colors.dart';

class StartWorkoutScreen extends StatefulWidget {
  const StartWorkoutScreen({super.key});

  @override
  State<StartWorkoutScreen> createState() => _StartWorkoutScreenState();
}

class _StartWorkoutScreenState extends State<StartWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: mobileBackgroundColor,
        title: const Text('Start an Empty Workout'),
        centerTitle: false,
      ),
      body:
      Container(
        
      ),
    );
  }
}