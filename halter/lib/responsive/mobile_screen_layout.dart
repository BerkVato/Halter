import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halter/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);


  @override
  State<MobileScreenLayout> createState() =>  _MobileScreenLayoutState();
}

class  _MobileScreenLayoutState extends State<MobileScreenLayout>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Welcome To Halter')
        ),
        bottomNavigationBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              backgroundColor: primaryColor,
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.sports),
              label: '',
              backgroundColor: primaryColor,
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: '',
              backgroundColor: primaryColor,
              ),
          ],
          ),
    );
  }
}
