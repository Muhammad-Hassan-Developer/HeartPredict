import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:heart_prediction/views/patient_view_screen.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Records')),
      body: Column(
        children: [
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${formData['Patient Name'] ?? 'Unknown'}',
                              style: const TextStyle(
                                color: AppColors.lightGreen,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text('Age: ${formData['Age']}', style: const TextStyle(color: AppColors.lightGreen)),
                            Text('Sex: ${formData['Sex']}', style: const TextStyle(color: AppColors.lightGreen)),
                            Text(
                              'Prediction: $prediction',
                              style: const TextStyle(color: AppColors.lightGreen, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Tap Successfully")),
                        );
                        log(prediction);
                        log(formData.toString());
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
    );
  }

}
