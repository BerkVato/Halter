import 'package:flutter/material.dart';
import 'package:halter/screens/exercise_screen.dart';

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
      body:
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64,),
                   MaterialButton (onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ExerciseScreen(),
                      ),
                    ),
                child: Text('Add Exercise'),
                color: blueColor,
                height: 50,
                minWidth: 300,
                
      ),
                ],
              ),
            ),
          )
       
    );
  }
}