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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.red, size: 30,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                subtitle: Text(
                  "Upper Body",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                trailing: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.access_time, color: Colors.white30
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "60 mins",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                          ),
                      ],
                    ),
                  ],
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}