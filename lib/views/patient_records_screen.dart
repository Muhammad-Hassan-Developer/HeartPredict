import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:heart_prediction/views/patient_view_screen.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/ui_helper/common_textFormField.dart';
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
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    patientData = FirebaseServices.getAllUserDataWithoutModel();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Header(heading: 'Patient Records', showBackButton: true),
            //SizedBox(height: screenHeight * 0.05),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonTextFormField(
                controller: searchController,
                label: 'Enter CNIC',
                hint: 'Enter CNIC',
                keyboard: TextInputType.number,
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: patientData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data found'));
                  }

                  final data = snapshot.data!;
                  final searchText = searchController.text.trim();

                  // Filtered list based on CNIC match
                  final filteredData =
                      searchText.isEmpty
                          ? data
                          : data.where((record) {
                            final formData = record['formData'] ?? {};
                            final cnic = formData['CNIC']?.toString() ?? '';
                            return cnic.contains(searchText);
                          }).toList();

                  if (filteredData.isEmpty) {
                    return const Center(child: Text('No matching CNIC found'));
                  }

                  return ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final formData = filteredData[index]['formData'];
                      final prediction =
                          filteredData[index]['predictionResult'];

                      return GestureDetector(
                        onTap: () {
                          DatedTime.updateDateTime();
                          log(
                            "Date: ${DatedTime.formattedDate} Time: ${DatedTime.formattedTime}",
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => PatientViewScreen(
                                    prediction: prediction,
                                    formData: formData,
                                  ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.lightRed,
                                  width: 3,
                                ),
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
                                  Text(
                                    'CNIC: ${formData['CNIC']}',
                                    style: const TextStyle(
                                      color: AppColors.lightRed,
                                    ),
                                  ),
                                  Text(
                                    'Date: ${formData['Date']}',
                                    style: const TextStyle(
                                      color: AppColors.lightRed,
                                    ),
                                  ),
                                  Text(
                                    'Time: ${formData['Time']}',
                                    style: const TextStyle(
                                      color: AppColors.lightRed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: screenHeight * .06,
                              left: screenWidth * .70,
                              child: GestureDetector(
                                child: Icon(
                                  Icons.delete_rounded,
                                  size: 40,
                                  color: AppColors.lightRed,
                                ),
                                onTap: (){
                                  log('del');

                                },
                              ),
                            ),
                          ],
                        ),
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
