import 'package:flutter/material.dart';

import 'color.dart';
class Header extends StatelessWidget {
  final String heading;
   const Header({super.key,required this.heading});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.15,
      width: screenWidth * double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(60), // Only bottom-right corner is rounded
        ),
        color: AppColors.lightRed,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),

      child: Center(
        child: Text(
          heading,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.08,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

