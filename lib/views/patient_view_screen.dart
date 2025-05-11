import 'package:flutter/material.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/ui_helper/common_row.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text("Patient Details")),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: IntrinsicHeight(
            child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
            BoxShadow(
            color: AppColors.lightGreen.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
            ),
            ],
            border: Border.all(color: Colors.blue.shade100),
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    formData['Patient Name'] ?? 'N/A',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),

                  // Wrap CNIC, Age, Sex to left in a Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center whole Row horizontally
                    children: [
                      // CNIC, Age, Sex (left-aligned)
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CNIC: ${formData['CNIC'] ?? 'N/A'}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: AppColors.lightRed)),
                            Text("Age: ${formData['Age'] ?? 'N/A'}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: AppColors.lightRed)),
                            Text("Sex: ${formData['Sex'] ?? 'N/A'}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: AppColors.lightRed)),
                          ],
                        ),
                      ),

                      // Spacer (optional, or you can add something else on right)
                      Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Text('Medical Record', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                  Column(
                    children: [
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Blood Pressure :', value: formData['Blood Pressure'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Heart Rate :', value: formData['Heart Rate'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Thalassemia Type :', value: formData['Thalassemia Type'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Fasting Sugar :', value: formData['Fasting Sugar'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'ECG :', value: formData['ECG'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Angina :', value: formData['Angina'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Cholesterol :', value: formData['Cholesterol'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Major Large Vessels :', value: formData['Major Large Vessels'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Chest Pain :', value: formData['Chest Pain'].toString()),
                      Text('---------------------------------------------------------------------'),
                      CommonRow(heading: 'Patient Depression :', value: formData['patient Depression'].toString()),
                      Text('---------------------------------------------------------------------'),
                    ],
                  ),

                  const Text("Prediction Result", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(prediction.toString(),style: TextStyle(color: AppColors.lightRed),),
                ],
              ),

            ),
            ),
            ),
      ),

    );
  }
}
