import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:heart_prediction/apis/basic/services/firebase_services.dart';
import 'package:heart_prediction/views/patient_records_screen.dart';
import 'package:heart_prediction/views/ui_helper/common_button.dart';
import 'package:heart_prediction/views/ui_helper/header.dart';


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
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(heading: 'Prediction Result', showBackButton: true),
      
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
