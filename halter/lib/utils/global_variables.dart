import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halter/screens/addworkout_screen.dart';
import 'package:halter/screens/home_screen.dart';
import 'package:halter/screens/profile_screen.dart';
import 'package:halter/screens/searchuser_screen.dart';
import 'package:halter/screens/workout_screen.dart';
const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const HomeScreen(),
  const SearchScreen(),
  const AddWorkoutScreen(),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,),
];
