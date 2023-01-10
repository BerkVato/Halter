import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halter/utils/colors.dart';

import '../widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: true,
        title: SvgPicture.asset('assets/dumbbellLogo.svg',
        color: primaryColor, 
        height: 32,
        ),
      ),
      body: const PostCard(snap: null,),
    );
  }
}