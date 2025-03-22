import 'package:flutter/material.dart';
import 'package:heart_prediction/views/patient_records_screen.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/ui_helper/common_button.dart';

import 'form_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width & height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Adjusted padding
          child: SingleChildScrollView( //  Prevent overflow
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header Container
                  Container(
                    height: screenHeight * 0.08,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightGreen,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Heart Disease Prediction',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.10), // Dynamic spacing

                  // Welcome Text
                  Text(
                    '👋 Welcome to!\n🔬 AI-Powered Heart Disease Prediction\n❤️ Stay Healthy, Stay Safe!',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.10), // Dynamic spacing

                  // Buttons Section
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Prediction Button
                          CommonButton(
                            buttonText: 'Prediction',
                            buttonHeight: 0.18,
                            buttonWidth: 0.38,
                            imagePath: 'images/heart.png',
                            imageHeight: 0.07,
                            imageWidth: 0.15,
                            pageName: FormScreen(), // Navigate to the  page
                          ),
                          SizedBox(width: screenWidth * 0.10), // Dynamic spacing

                          // Records Button
                          CommonButton(
                            buttonText: 'Records',
                            buttonHeight: 0.18,
                            buttonWidth: 0.38,
                            imagePath: 'images/patient.png',
                            imageHeight: 0.07,
                            imageWidth: 0.15,
                            pageName: PatientRecordsScreen(), // Navigate to the  page
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
