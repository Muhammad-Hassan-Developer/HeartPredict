import 'dart:developer' ;

import 'package:firebase_database/firebase_database.dart';

class FirebaseServices{

  static Future<void> sendFormDataToFirebase(String predictionResult, Map<String, dynamic> formData) async {
    final cnic = formData["CNIC"]; // Use the correct prefixed key

    if (cnic == null || cnic.isEmpty) {
      log("Error: CNIC is null or empty. Data not saved.");
      return;
    }

    final Map<String, dynamic> dataForFirebaseDb = {
      'formData': formData,
      'predictionResult': predictionResult,
    };

    final dbRef = FirebaseDatabase.instance.ref('user-data/$cnic');
    await dbRef.push().set(dataForFirebaseDb);

    log("Data saved under CNIC: $cnic");
  }

  static Future<List<Map<String, dynamic>>> getAllUserDataWithoutModel() async {
    final dbRef = FirebaseDatabase.instance.ref().child('user-data');
    List<Map<String, dynamic>> patientRecords = [];

    try {
      final snapshot = await dbRef.get();

      if (snapshot.exists) {
        final Map<dynamic, dynamic> userData = snapshot.value as Map<dynamic, dynamic>;

        userData.forEach((cnic, entries) {
          final Map<dynamic, dynamic> entriesMap = entries as Map<dynamic, dynamic>;

          entriesMap.forEach((entryKey, data) {
            final Map<dynamic, dynamic> dataMap = data as Map<dynamic, dynamic>;
            final formData = Map<String, dynamic>.from(dataMap['formData']);
            final prediction = dataMap['predictionResult'];

            patientRecords.add({
              'CNIC': cnic,
              'Patient Name': formData["Patient Name"],
              'Prediction': prediction,
              'Form Data': formData,
            });
          });
        });
      } else {
        log('No data found in user-data.');
      }
    } catch (e) {
      log('Error reading data: $e');
    }

    return patientRecords;
  }



// Define your Firebase reference




}