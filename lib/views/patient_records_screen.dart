import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:heart_prediction/views/patient_view_screen.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/ui_helper/dated_time.dart';
import 'package:heart_prediction/views/ui_helper/header.dart';

import '../apis/basic/services/firebase_services.dart';


class PatientRecordsScreen extends StatefulWidget {
  const PatientRecordsScreen({super.key});

  @override
  State<PatientRecordsScreen> createState() => _PatientRecordsScreenState();
}

class _PatientRecordsScreenState extends State<PatientRecordsScreen> {
  late Future<List<Map<String, dynamic>>> patientData;

  @override
  void initState() {
    super.initState();
    patientData = FirebaseServices.getAllUserDataWithoutModel();
  }
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Get screen width & height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Header(heading: 'Patient Records', showBackButton: true),
            SizedBox(height: screenHeight * 0.05),
            // Add optional search bar here later
            Expanded( // 👈 Moved here
              child: FutureBuilder(
                future: patientData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data found'));
                  }

                  final data = snapshot.data!;

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final formData = data[index]['formData'];
                      final prediction = data[index]['predictionResult'];

                      return GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color:AppColors.lightRed,width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${formData['Patient Name'] ?? 'Unknown'}',
                                style: const TextStyle(
                                  color: AppColors.lightRed,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text('CNIC: ${formData['CNIC']}', style: const TextStyle(color: AppColors.lightRed)),
                              Text('Date: ${formData['Date']}', style: const TextStyle(color: AppColors.lightRed)),
                              Text('Time: ${formData['Time']}', style: const TextStyle(color: AppColors.lightRed)),
                            ],
                          ),
                        ),
                        onTap: () {
                          DatedTime.updateDateTime();
                          log("Date: ${DatedTime.formattedDate} Time: ${DatedTime.formattedTime}");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientViewScreen(

                                prediction: prediction,
                                formData: formData,
                              ),
                            ),
                          );
                        },

                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
