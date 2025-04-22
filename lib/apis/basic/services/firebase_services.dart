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

  static Future<List<Map<String, dynamic>>> getFormDataFromFirebase() async {
    final dbRef = FirebaseDatabase.instance.ref('user-data');
    final dataSnapshot = await dbRef.get();

    if (dataSnapshot.exists) {
      // Convert data into a list of maps
      final List<Map<String, dynamic>> userData = [];

      // Assuming data is a map where each user has an ID (key) and the data as a map
      Map<dynamic, dynamic> data = dataSnapshot.value as Map<dynamic, dynamic>;

      data.forEach((key, value) {
        userData.add(Map<String, dynamic>.from(value));
      });

      return userData;
    } else {
      return [];
    }
  }

}