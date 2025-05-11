import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:heart_prediction/apis/basic/services/firebase_services.dart';
import 'package:heart_prediction/views/patient_records_screen.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/ui_helper/common_button.dart';


class PredictionScreen extends StatefulWidget {
  final String predictionResult;
  final Map<String,dynamic> formData;

  const PredictionScreen({super.key, required this.predictionResult, required this.formData});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {




  @override
  Widget build(BuildContext context) {
    log('Prediction Result: ${widget.predictionResult}');
    // Get screen width & height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
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
                    'Prediction Result',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
      
              SizedBox(height: 40),
              // Text(
              //   'Result:',
              //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: 15),
              Text(
                widget.predictionResult,
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              SizedBox(height: 40),
              CommonButton(buttonText: "Save Data", buttonHeight: 0.08, buttonWidth: 0.90, onTap: ()async{
                await  FirebaseServices.sendFormDataToFirebase(widget.predictionResult,widget.formData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Data saved successfully")),
                  );
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientRecordsScreen()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
