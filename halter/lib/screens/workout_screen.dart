import 'package:flutter/material.dart';
import 'package:halter/screens/addworkout_screen.dart';
import 'package:halter/utils/colors.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Start Workout'),
        centerTitle: false,
        actions: [
          TextButton(onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddWorkoutScreen(),
                  ),
                ),
          child: const Text('Start an Empty Workout', style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          ),
          ),
        ],
      ),
    );
  }
}