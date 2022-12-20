import 'package:flutter/material.dart';
import 'package:halter/utils/colors.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    //return Center(
      //child: IconButton(
        //icon: const Icon(Icons.upload),
        //onPressed: () {},
      //),
    //);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Start Workout'),
        centerTitle: false,
        actions: [
          TextButton(onPressed: (){}, child: const Text('Start an Empty Workout', style: TextStyle(
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