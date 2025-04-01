import 'package:flutter/material.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/ui_helper/common_textFormField.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController patientName = TextEditingController();
  final TextEditingController patientAge = TextEditingController();
  final TextEditingController patientCard = TextEditingController();
  final TextEditingController patientBloodPressure = TextEditingController();
  final TextEditingController patientCholesterol = TextEditingController();
  final TextEditingController patientDepression = TextEditingController();
  final TextEditingController patientHeartRate = TextEditingController();
  List<String> gendersList = ['Male', 'Female'];
  String? selectedGender = 'Male';
  List<String> fastingSugarList = ['normal', 'high'];
  String? selectedFastingSugar = 'normal';
  List<String> anginaList = ['no', 'yes'];
  String? selectedAngina = 'no';
  // lists for the dropdown menu
  // chest pain
  List<String>chestPain = ['typical angina', 'atypical angina', 'non-anginal pain', 'asymptomatic'];
  String? selectedChestPain;
  List<String>ecgResults = ['Normal', 'ST-wave abnormality', 'Left ventricular hypertrophy'];
  String? selectedEcgResults;
  List<String>slopOfPeakExercise = ['Up-sloping', 'flat', 'Down-sloping'];
  String? selectedSlopOfPeakExercise;
  List<String>majorLargeVessels = ['0', '1', '2', '3', '4'];
  String? selectedMajorLargeVessels;
  List<String>thalassemiaType=['Normal', 'Fixed defect', 'Reversible defect'];
  String? selectedThalassemiaType;

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
                  //From Submission Container
                  Container(
                    height: screenHeight * 0.08,
                    width: double.infinity,
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
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //Patient age
                        CommonTextFormField(
                          controller: patientAge,
                          label: 'Age',
                          hint: 'Enter Age',
                          keyboard: TextInputType.number,
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        //Patient National Card
                        CommonTextFormField(
                          controller: patientCard,
                          label: 'CNIC',
                          hint: 'Enter CNIC',
                          keyboard: TextInputType.number,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'CNIC is required';
                            } else if (!RegExp(r'^\d{5}-\d{7}-\d{1}$').hasMatch(value)) {
                              return 'Enter CNIC in format: #####-#######-#';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start, // Align text and radio buttons to start
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RadioListTile<String>(
                              title: Text('Male'),
                              value: gendersList[0],
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text('Female'),
                              value: gendersList[1],
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
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
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedChestPain,
                          items: chestPain.map((String city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(city),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedChestPain = newValue;
                            });
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //Patient Blood Pressure
                        CommonTextFormField(
                          controller: patientBloodPressure,
                          label: 'Blood Pressure',
                          hint: 'Enter BP (94 - 200 mmHg)',
                          keyboard: TextInputType.number,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // Patient Cholesterol
                        CommonTextFormField(
                          controller: patientCholesterol,
                          label: 'Cholesterol',
                          hint: 'Enter Cholesterol (126 - 564 mg/dl)',
                          keyboard: TextInputType.number,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start, // Align text and radio buttons to start
                          children: [
                            Text(
                              'Fasting Blood Sugar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RadioListTile<String>(
                              title: Text('Normal'),
                              value: fastingSugarList[0],
                              groupValue: selectedFastingSugar,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text('High'),
                              value: fastingSugarList[1],
                              groupValue: selectedFastingSugar,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                          ],
                        ),
                        //ECG Results
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Select ECG Result",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedEcgResults,
                          items: ecgResults.map((String ecgResults) {
                            return DropdownMenuItem<String>(
                              value: ecgResults,
                              child: Text(ecgResults),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedEcgResults = newValue;
                            });
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
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedSlopOfPeakExercise,
                          items: slopOfPeakExercise.map((String slopOfPeakExercise) {
                            return DropdownMenuItem<String>(
                              value: slopOfPeakExercise,
                              child: Text(slopOfPeakExercise),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSlopOfPeakExercise = newValue;
                            });
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //Major Vessels
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Select No. of Major Vessels(0-4)",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedMajorLargeVessels,
                          items: majorLargeVessels.map((String selectedMajorLargeVessels) {
                            return DropdownMenuItem<String>(
                              value: selectedMajorLargeVessels,
                              child: Text(selectedMajorLargeVessels),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedMajorLargeVessels = newValue;
                            });
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
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          value: selectedThalassemiaType,
                          items: thalassemiaType.map((String selectedThalassemiaType) {
                            return DropdownMenuItem<String>(
                              value: selectedThalassemiaType,
                              child: Text(selectedThalassemiaType),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedThalassemiaType = newValue;
                            });
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //Patient Heart Rate
                        CommonTextFormField(
                          controller: patientHeartRate,
                          label: 'Heart Rate',
                          hint: 'Enter Max HR (71 - 202 bpm)',
                          keyboard: TextInputType.number,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start, // Align text and radio buttons to start
                          children: [
                            Text(
                              'Exercise-Induced Angina',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RadioListTile<String>(
                              title: Text('No'),
                              value: anginaList[0],
                              groupValue: selectedAngina,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text('Yes'),
                              value: anginaList[1],
                              groupValue: selectedAngina,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //Patient Depression Exercise
                        CommonTextFormField(
                          controller: patientDepression,
                          label: 'ST Depression Induced by Exercise',
                          hint: 'Enter Old-peak (0.0 - 6.2)',
                          keyboard: TextInputType.number,
                        ),
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
