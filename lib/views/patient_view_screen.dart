import 'package:flutter/material.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/ui_helper/common_row.dart';
import 'package:heart_prediction/views/ui_helper/header.dart';

class PatientViewScreen extends StatelessWidget {
  final dynamic prediction; //
  final Map<String, dynamic> formData;

  const PatientViewScreen({
    super.key,
    required this.prediction,
    required this.formData,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(heading: 'Patient Detail', showBackButton: true),
            Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
            BoxShadow(
            color: AppColors.lightRed.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
            ),
            ],
            border: Border.all(color: AppColors.lightRed),
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    formData['Patient Name'] ?? 'N/A',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),

                  // Wrap CNIC, Age, Sex to left in a Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "CNIC: ${formData['CNIC'] ?? 'N/A'}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightRed,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Age: ${formData['Age'] ?? 'N/A'}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightRed,
                        ),
                      ),
                      Text(
                        "Date: ${formData['Date'] ?? 'N/A'}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightRed,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sex: ${formData['Sex'] ?? 'N/A'}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightRed,
                        ),
                      ),
                      Text(
                        "Time: ${formData['Time'] ?? 'N/A'}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightRed,
                        ),
                      ),
                    ],
                  ),



                  const SizedBox(height: 2),

                  Text('Medical Record', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                  Column(
                    children: [
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Blood Pressure ', value: formData['Blood Pressure'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Heart Rate ', value: formData['Heart Rate'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Thalassemia Type ', value: formData['Thalassemia Type'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Fasting Sugar ', value: formData['Fasting Sugar'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'ECG ', value: formData['ECG'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Angina ', value: formData['Angina'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Cholesterol ', value: formData['Cholesterol'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Major Large Vessels ', value: formData['Major Large Vessels'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Chest Pain ', value: formData['Chest Pain'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Patient Depression ', value: formData['patient Depression'].toString()),
                      Text('---------------------------------------------------------------------'),
                    ],
                  ),

                  const Text("Prediction Result", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(prediction.toString(),style: TextStyle(color: AppColors.lightRed),),
                ],
              ),

            ),
          ],
        ),

      ),
    );
  }
}
