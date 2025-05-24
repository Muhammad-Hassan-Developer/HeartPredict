import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:heart_prediction/views/patient_records_screen.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';

import 'package:heart_prediction/views/ui_helper/common_button.dart';
import 'package:heart_prediction/views/ui_helper/header.dart';
import 'package:heart_prediction/views/ui_helper/heart_loader.dart';
import 'package:heart_prediction/views/ui_helper/heart_loader_screen.dart';

import '../apis/basic/services/firebase_services.dart';
import 'form_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width & height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( //  Prevent overflow
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header Container
                Header(heading: 'Heart Disease Prediction'),
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
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FormScreen()));
                          }, // Navigate to the  page
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
                            onTap: () async {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) =>  HeartLoaderScreen(),
                              );

                              try {
                                final data = await FirebaseServices.getAllUserDataWithoutModel();
                                log("Data length: ${data.length}");

                                // Dismiss loading dialog
                                Navigator.pop(context);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PatientRecordsScreen(),
                                  ),
                                );
                              } catch (e) {
                                Navigator.pop(context); // remove loader if error
                                log('Error while fetching: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error fetching data")),
                                );
                              }
                            }

                          // Navigate to the  page
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
    );
  }
}
