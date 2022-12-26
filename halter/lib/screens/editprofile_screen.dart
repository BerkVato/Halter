import 'package:flutter/material.dart';
import 'package:halter/utils/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: mobileBackgroundColor,
        title: const Text('Edit Profile'),
        centerTitle: false,


      ),
    );
  }
}