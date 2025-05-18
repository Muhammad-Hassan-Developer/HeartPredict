import 'package:flutter/material.dart';
import 'color.dart';

class Header extends StatelessWidget {
  final String heading;
  final bool showBackButton; // Optional parameter

  const Header({
    super.key,
    required this.heading,
    this.showBackButton = false, // Defaults to false
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.15,
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(60),
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
      child: Stack(
        children: [
          Center(
            child: Text(
              heading,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          if (showBackButton)
            Positioned(
              left: screenWidth * 0.001,
              top: screenHeight * 0.05,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white,size: 30,),
                onPressed: () => Navigator.pop(context),
              ),
            ),
        ],
      ),
    );
  }
}
