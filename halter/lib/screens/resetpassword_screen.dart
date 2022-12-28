import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halter/utils/colors.dart';
import 'package:halter/widgets/text_field_input.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: this.context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Password reset mail sent to your personal email'),
          );
        },
      );
    } on FirebaseAuthException catch (err) {
      showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            content: Text(err.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Text(
              "Enter your Email and we will send you a password reset link",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),

          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFieldInput(
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              passwordReset();
            },
            child: Text('Reset Password'),
            color: blueColor,
          )
        ],
      ),
    );
  }
}
