import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:heart_prediction/views/prediction_screen.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/ui_helper/common_button.dart';
import 'package:heart_prediction/views/ui_helper/common_textFormField.dart';

import '../apis/basic/all_apis/all_apis.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  Future <void> resultPrediction(dataForPrediction,formData) async {
    try {
      // Call prediction API

      String predictionResult = await AllApis
          .predictHeartDiseaseApi(dataForPrediction);

      final String finalResult = predictionResult ==
          '1'
          ? 'Yes, the patient has heart disease.'
          : 'No, the patient does not have heart disease.';

      Navigator.pop(context); // Remove loading indicator

      // Go to result screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PredictionScreen(
            predictionResult: finalResult,formData: formData,
          ),
        ),
      );
    } catch (e) {
      Navigator.pop(context); // Remove loading if error
      log("❌ Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error occurred while predicting.")),
      );
    }
  }
  final _formKey = GlobalKey<FormState>();
  final dbRef = FirebaseDatabase.instance.ref('user-data');
  // Text Editing Controllers
  final TextEditingController patientName = TextEditingController();
  final TextEditingController patientAge = TextEditingController();
  final TextEditingController patientCard = TextEditingController();
  final TextEditingController patientBloodPressure = TextEditingController();
  final TextEditingController patientCholesterol = TextEditingController();
  final TextEditingController patientDepression = TextEditingController();
  final TextEditingController patientHeartRate = TextEditingController();
  //radio button lists
  // gender
  List<String> gendersList = ['Male', 'Female'];
  String? selectedGender; // No default selected
  int? selectedGenderValue; // to store mapped value (1 or 0)
  // map for gender
  Map<String, int> genderMap = {'Male': 1, 'Female': 0};
  // fasting sugar
  List<String> fastingSugarList = ['Normal', 'High'];
  String? selectedFastingSugar;
  int? selectedFastingSugarValue;
  Map<String, int> fastingSugarMap = {'Normal': 0, 'High': 1};
  // exercise-induced angina
  List<String> anginaList = ['No', 'Yes'];
  String? selectedAngina;
  int? selectedAnginaValue;
  Map<String, int> anginaMap = {'No': 0, 'Yes': 1};

  // lists for the dropdown menu
  // chest pain
  String? selectedChestPain; // For storing dropdown label
  int? selectedChestPainValue; // For storing mapped int value
  // map for chest pain
  Map<String, int> chestPainMap = {
    "Typical Angina": 0,
    "Atypical Angina": 1,
    "Non-anginal Pain": 2,
    "Asymptomatic": 3,
  };
  // Ecg Results
  String? selectedEcgResults;
  int? selectedEcgResultValue;
  Map<String, int> ecgResultsMap = {
    'Normal': 0,
    'ST-wave abnormality': 1,
    'Left ventricular hypertrophy': 2,
  };
  // slop of peak exercise
  String? selectedSlopOfPeakExercise;
  int? selectedSlopOfPeakExerciseValue;
  Map<String, int> slopOfPeakExerciseMap = {
    'Up-sloping': 0,
    'flat': 1,
    'Down-sloping': 2,
  };
  // major vessels
  String? selectedMajorLargeVessels;
  int? selectedMajorLargeVesselsValue;
  Map<String, int> majorLargeVesselsMap = {
    '0': 0,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
  };
  // thalassemia
  String? selectedThalassemiaType;
  int? selectedThalassemiaTypeValue;
  Map<String, int> thalassemiaTypeMap = {
    'Normal': 1,
    'Fixed defect': 2,
    'Reversible defect': 3,
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //   'Form Submission',
      //   style: TextStyle(fontSize: 25,),
      // ),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  //Form Submission Container
                  Container(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightGreen,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Form Submission',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  //Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //Patient name
                        CommonTextFormField(
                          controller: patientName,
                          label: 'Patient Name',
                          hint: 'Enter Name',
                          keyboard: TextInputType.text,
                          validation: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter patient name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //Patient age
                        CommonTextFormField(
                          controller: patientAge,
                          label: 'Age',
                          hint: 'Enter Age',
                          keyboard: TextInputType.number,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter age';
                            }
                            final age = int.tryParse(value);
                            if (age == null || age <= 0) {
                              return 'Enter a valid age';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        //Patient National Card
                        CommonTextFormField(
                          controller: patientCard,
                          label: 'CNIC',
                          hint: 'Enter CNIC in format: #####-#######-#',
                          keyboard: TextInputType.number,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'CNIC is required';
                            } else if (!RegExp(
                              r'^\d{5}-\d{7}-\d{1}$',
                            ).hasMatch(value)) {
                              return 'Enter CNIC in format: #####-#######-#';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //gender radio button
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ...gendersList.map((gender) {
                              return RadioListTile<String>(
                                title: Text(gender),
                                value: gender,
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                    selectedGenderValue =
                                        genderMap[value!]; // 🎯 mapped int value
                                  });
                                },
                              );
                            }),
                          ],
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        //chestPain dropdown menu
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Select Chest Pain",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedChestPain,
                          items:
                              chestPainMap.keys.map((String chestPainType) {
                                return DropdownMenuItem<String>(
                                  value: chestPainType,
                                  child: Text(chestPainType),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedChestPain = newValue; // 💾 Save label
                              selectedChestPainValue =
                                  chestPainMap[newValue]; // 💾 Save mapped value
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a Chest Pain type';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        //Patient Blood Pressure
                        CommonTextFormField(
                          controller: patientBloodPressure,
                          label: 'Blood Pressure',
                          hint: 'Enter BP (94 - 200 mmHg)',
                          keyboard: TextInputType.number,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Blood Pressure is required';
                            }
                            final num? bp = num.tryParse(value);
                            if (bp == null) {
                              return 'Enter a valid number';
                            }
                            if (bp < 94 || bp > 200) {
                              return 'BP must be between 94 - 200 mmHg';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        // Patient Cholesterol
                        CommonTextFormField(
                          controller: patientCholesterol,
                          label: 'Cholesterol',
                          hint: 'Enter Cholesterol (126 - 564 mg/dl)',
                          keyboard: TextInputType.number,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cholesterol is required';
                            }
                            final num? cholesterol = num.tryParse(value);
                            if (cholesterol == null) {
                              return 'Enter a valid number';
                            }
                            if (cholesterol < 126 || cholesterol > 564) {
                              return 'Cholesterol must be between 126 - 564 mg/dl';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        //Fasting Blood Sugar
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fasting Blood Sugar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ...fastingSugarList.map((fastingSugar) {
                              return RadioListTile<String>(
                                title: Text(fastingSugar),
                                value: fastingSugar,
                                groupValue: selectedFastingSugar,
                                onChanged: (value) {
                                  setState(() {
                                    selectedFastingSugar = value;
                                    selectedFastingSugarValue =
                                        fastingSugarMap[value!]; // 🎯 mapped int value
                                  });
                                },
                              );
                            }),
                          ],
                        ),
                        //ECG Results
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Select ECG Results",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedEcgResults,
                          items:
                              ecgResultsMap.keys.map((String ecgResult) {
                                return DropdownMenuItem<String>(
                                  value: ecgResult,
                                  child: Text(ecgResult),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedEcgResults = newValue; // 💾 Save label
                              selectedEcgResultValue =
                                  ecgResultsMap[newValue]; // 💾 Save mapped value
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a Ecg Result';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //Slope of Peak Exercise
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Select Slope of Peak Exercise",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedSlopOfPeakExercise,
                          items:
                              slopOfPeakExerciseMap.keys.map((String slop) {
                                return DropdownMenuItem<String>(
                                  value: slop,
                                  child: Text(slop),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSlopOfPeakExercise =
                                  newValue; // 💾 Save label
                              selectedSlopOfPeakExerciseValue =
                                  slopOfPeakExerciseMap[newValue]; // 💾 Save mapped value
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select slope type';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        //Major Vessels
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Select Major Vessels",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedMajorLargeVessels,
                          items:
                              majorLargeVesselsMap.keys.map((
                                String majorVessels,
                              ) {
                                return DropdownMenuItem<String>(
                                  value: majorVessels,
                                  child: Text(majorVessels),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedMajorLargeVessels =
                                  newValue; // 💾 Save label
                              selectedMajorLargeVesselsValue =
                                  majorLargeVesselsMap[newValue]; // 💾 Save mapped value
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select Major Vessels';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        //Thalassemia Type
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Select Thalassemia Type",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedThalassemiaType,
                          items:
                              thalassemiaTypeMap.keys.map((String thalassemia) {
                                return DropdownMenuItem<String>(
                                  value: thalassemia,
                                  child: Text(thalassemia),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedThalassemiaType =
                                  newValue; // 💾 Save label
                              selectedThalassemiaTypeValue =
                                  thalassemiaTypeMap[newValue]; // 💾 Save mapped value
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select Thalassemia Type';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        //Patient Heart Rate
                        CommonTextFormField(
                          controller: patientHeartRate,
                          label: 'Heart Rate',
                          hint: 'Enter Max HR (71 - 202 bpm)',
                          keyboard: TextInputType.number,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Heart Rate is required';
                            }
                            final num? heartRate = num.tryParse(value);
                            if (heartRate == null) {
                              return 'Enter a valid number';
                            }
                            if (heartRate < 71 || heartRate > 202) {
                              return 'Heart Rate must be between 71 - 202 bpm';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        //Exercise-Induced angina
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exercise-Induced Angina',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ...anginaList.map((angina) {
                              return RadioListTile<String>(
                                title: Text(angina),
                                value: angina,
                                groupValue: selectedAngina,
                                onChanged: (value) {
                                  setState(() {
                                    selectedAngina = value;
                                    selectedAnginaValue =
                                        anginaMap[value!]; // 🎯 mapped int value
                                  });
                                },
                              );
                            }),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //Patient Depression Exercise
                        CommonTextFormField(
                          controller: patientDepression,
                          label: 'ST Depression Induced by Exercise',
                          hint: 'Enter Old-peak (0.0 - 6.2)',
                          keyboard: TextInputType.number,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'ST Depression is required';
                            }
                            final double? depression = double.tryParse(value);
                            if (depression == null) {
                              return 'Enter a valid number';
                            }
                            if (depression < 0.0 || depression > 6.2) {
                              return 'Old-peak must be between 0.0 - 6.2';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        //Predict Button
                        CommonButton(
                          buttonText: 'Predict',
                          buttonHeight: 0.08,
                          buttonWidth: 0.80,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                // Show loading indicator
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => Center(child: CircularProgressIndicator()),
                                );
                                final Map<String, dynamic> formData = {
                                  "Patient Name": patientName.text ,
                                  "CNIC": patientCard.text ,
                                  "Age": patientAge.text ,
                                  "Sex": selectedGender,
                                  "Chest Pain": selectedChestPain,
                                  "Blood Pressure":patientBloodPressure.text,
                                  "Cholesterol": patientCholesterol.text,
                                  "Fasting Sugar": selectedFastingSugar,
                                  "ECG": selectedEcgResults,
                                  "Heart Rate": patientHeartRate.text,
                                  "Angina": selectedAngina,
                                  "patient Depression": patientDepression.text,
                                  "Slop": selectedSlopOfPeakExercise,
                                  "Major Large Vessels": selectedMajorLargeVessels,
                                  "Thalassemia Type": selectedThalassemiaType,
                                };
                                final Map<String, double> dataForPrediction = {
                                  "age": double.tryParse(patientAge.text) ?? 0.0,
                                  "sex": selectedGenderValue?.toDouble() ?? 0.0,
                                  "cp": selectedChestPainValue?.toDouble() ?? 0.0,
                                  "trestbps": double.tryParse(patientBloodPressure.text) ?? 0.0,
                                  "chol": double.tryParse(patientCholesterol.text) ?? 0.0,
                                  "fbs": selectedFastingSugarValue?.toDouble() ?? 0.0,
                                  "restecg": selectedEcgResultValue?.toDouble() ?? 0.0,
                                  "thalach": double.tryParse(patientHeartRate.text) ?? 0.0,
                                  "exang": selectedAnginaValue?.toDouble() ?? 0.0,
                                  "oldpeak": double.tryParse(patientDepression.text) ?? 0.0,
                                  "slope": selectedSlopOfPeakExerciseValue?.toDouble() ?? 0.0,
                                  "ca": selectedMajorLargeVesselsValue?.toDouble() ?? 0.0,
                                  "thal": selectedThalassemiaTypeValue?.toDouble() ?? 0.0,
                                };
                                resultPrediction(dataForPrediction,formData);
                               }

                            }

                        ),
                        SizedBox(height: screenHeight * 0.02),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
