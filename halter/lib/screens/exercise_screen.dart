import 'package:flutter/material.dart';
import 'package:halter/resources/firestore_methods.dart';
import 'package:halter/screens/startworkout_screen.dart';
import 'package:halter/utils/colors.dart';
import 'package:halter/widgets/text_field_input.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../utils/utils.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final TextEditingController _exerciseController = TextEditingController();
  final TextEditingController _setsController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  bool _isLoading = false;

  void dispose() {
    super.dispose();
    _exerciseController.dispose();
    _setsController.dispose();
    _weightController.dispose();
  }

  void finishExercise(
    String uid,
  ) async {
    setState(() {
      _isLoading = true;
    });

    String res = await FireStoreMethods().addExercise(
      _exerciseController.text,
      _setsController.text,
      _weightController.text,
      uid,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
// ignore: use_build_context_synchronously
      showSnackBar(res, context);
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const StartWorkoutScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 64,
            ),
            TextFieldInput(
              hintText: 'Enter Exercise Name',
              textInputType: TextInputType.text,
              textEditingController: _exerciseController,
            ),
            const SizedBox(
              height: 32,
            ),
            TextFieldInput(
              hintText: 'Enter Number of Sets',
              textInputType: TextInputType.text,
              textEditingController: _setsController,
            ),
            const SizedBox(
              height: 32,
            ),
            TextFieldInput(
              hintText: 'Enter Weight',
              textInputType: TextInputType.text,
              textEditingController: _weightController,
            ),
            const SizedBox(
              height: 32,
            ),
            // exercise savelenecek ve workoutun içine atılacak
            MaterialButton(
              onPressed: () => finishExercise(
                UserProvider().getUser.uid,
              ),
              child: Text('Finish Exercise'),
              color: blueColor,
            ),
            const SizedBox(
              height: 16,
            ),
            MaterialButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StartWorkoutScreen(),
                ),
              ),
              child: Text('Discard Exercise'),
              color: Colors.red,
            ),
          ],
        ),
      ),
    ));
  }
}
