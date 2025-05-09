import 'dart:developer' ;
import 'package:firebase_database/firebase_database.dart';

class FirebaseServices{
  static final dbRef = FirebaseDatabase.instance.ref().child('user-data');
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
      try {
        final snapshot = await dbRef.once();

        if (snapshot.snapshot.value == null) {
          return [];
        }

        final Map<dynamic, dynamic> data =
        snapshot.snapshot.value as Map<dynamic, dynamic>;

        final List<Map<String, dynamic>> patientList = [];

        data.forEach((cnic, recordMap) {
          if (recordMap is Map) {
            recordMap.forEach((key, value) {
              if (value is Map && value.containsKey('formData')) {
                final formData = Map<String, dynamic>.from(value['formData']);
                final prediction = value['predictionResult'] ?? 'No result';

                patientList.add({
                  'formData': formData,
                  'predictionResult': prediction,
                });
              }
            });
          }
        });

        return patientList;
      } catch (e) {
        log('Error fetching user data: $e');
        return [];
      }
    }

// Define your Firebase reference




}