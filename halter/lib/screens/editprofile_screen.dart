import 'package:flutter/material.dart';
import 'package:halter/utils/colors.dart';
import 'package:halter/widgets/text_field_input.dart';



class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: mobileBackgroundColor,
        title: const Text('Edit Profile'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'),
                  ),
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: (() {}),
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              TextFieldInput(
                hintText: 'username',
                textInputType: TextInputType.text,
                textEditingController:  ,
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
