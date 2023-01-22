import 'dart:typed_data';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halter/models/user.dart' as model;
import 'package:halter/providers/user_provider.dart';
import 'package:halter/resources/storage_methods.dart';
import 'package:halter/screens/resetpassword_screen.dart';
import 'package:halter/utils/colors.dart';
import 'package:halter/utils/utils.dart';
import 'package:halter/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatefulWidget {
   EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _bioController = TextEditingController();

  Uint8List? _image;

 Future<String> updateProfile(String uid, String bioController, Uint8List? file ) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
    String photoUrl =
          await StorageMethods().uploadImageToStorage('users', file!, false);
    String res = 'Some error occured';
    try {
      if (bioController.isNotEmpty ) {
        docUser.update({
          
          'bio' : bioController,
          'photoUrl' : photoUrl
        });
        return 'success';
      }
    } catch(err){
      res = err.toString();
    }
    return res;
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model.User user = Provider.of<UserProvider>(context).getUser;
    void navigateToResetPassword() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ResetPasswordScreen()));
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: mobileBackgroundColor,
        title: const Text('Edit Profile'),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3ltfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                          ),
                        ),
                      ),
                    ),
                    Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              const SizedBox(
                height: 26,
              ),
              TextFieldInput(
                hintText: 'Enter your new bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  navigateToResetPassword();
                },
                child: Text('Change Password'),
                color: blueColor,
              ),
              SizedBox(
                height: 35,
              ),
              MaterialButton(
                onPressed: () { updateProfile(user.uid, _bioController.text, _image);
            
                },
                child: Text('Confirm Changes'),
                color: blueColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Padding buildTextField(
    String labelText, String placeholder, bool isPasswordTextField) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextField(
      obscureText: isPasswordTextField,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 3),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
