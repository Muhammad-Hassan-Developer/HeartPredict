import 'package:flutter/material.dart';

import 'color.dart';

class CommonButton extends StatelessWidget {
  final double? imageHeight;
  final double? imageWidth;
  final String? imagePath;
  final String buttonText;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback onTap;
  const CommonButton({
    super.key,
    required this.buttonText,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.onTap,
    this.imagePath,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight * buttonHeight, // Dynamic height
        width: screenWidth * buttonWidth, // Dynamic width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGreen,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath!,
              height: screenHeight * imageHeight!, // Dynamic image size
              width: screenWidth * imageWidth!,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.01), // Dynamic spacing
            Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.045, // Adjusted font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
