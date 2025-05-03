import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PatientRecordsScreen extends StatefulWidget {
  const PatientRecordsScreen({super.key}); // ✅ Removed `records` parameter

  @override
  State<PatientRecordsScreen> createState() => _PatientRecordsScreenState();
}

class _PatientRecordsScreenState extends State<PatientRecordsScreen> {
  final dbRef = FirebaseDatabase.instance.ref().child('user-data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Patient Records', style: TextStyle(fontSize: 25)),
            Expanded(
              child: StreamBuilder<DatabaseEvent>(
                stream: dbRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
                    return const Center(child: Text('No data available'));
                  }

                  // Parse nested JSON structure
                  final Map<dynamic, dynamic> data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                  final List<Map<String, dynamic>> patientList = [];
                  data.forEach((cnic, recordMap) {
                    if (recordMap is Map) {
                      recordMap.forEach((key, value) {
                        if (value is Map && value.containsKey('formData')) {
                          final formData = Map<String, dynamic>.from(value['formData']);
                          final prediction = value['predictionResult'] ?? 'No result';

                          // Add both formData and prediction to the list
                          patientList.add({
                            'formData': formData,
                            'predictionResult': prediction,
                          });
                        }
                      });
                    }
                  });

                  return ListView.builder(
                    itemCount: patientList.length,
                    itemBuilder: (context, index) {
                      final patient = patientList[index];
                      final formData = patient['formData'];
                      final prediction = patient['predictionResult'];

                      return ListTile(
                        title: Text(formData['Patient Name'] ?? 'Unknown'),
                        subtitle: Text('Prediction: $prediction'),
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
