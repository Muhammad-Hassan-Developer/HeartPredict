import 'package:flutter/material.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final TextEditingController patientName = TextEditingController();
  List<String> gendersList = ['Male', 'Female'];
  String? selectedGender = 'Male';
  List<String> fastingSugarList = ['normal', 'high'];
  String? selectedFastingSugar = 'normal';
  List<String> anginaList = ['no', 'yes'];
  String? selectedAngina= 'no';
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
                  Form(
                    child: Column(
                      children: [
                        //patient name
                        TextFormField(
                          controller: patientName,
                          decoration: InputDecoration(
                            labelText: 'Patient Name',
                            hintText: 'Enter Patient Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ), // Change color when focused
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Keep rounded corners when focused
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //age
                        TextFormField(
                          controller: patientName,
                          decoration: InputDecoration(
                            labelText: 'Age',
                            hintText: 'Enter Patient Age',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ), // Change color when focused
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Keep rounded corners when focused
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        //CNIC
                        TextFormField(
                          controller: patientName,
                          decoration: InputDecoration(
                            labelText: 'CNIC',
                            hintText: 'Enter CNIC',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ), // Change color when focused
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Keep rounded corners when focused
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align text and radio buttons to start
                          children: [
                            Text('Gender', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                        TextFormField(
                          controller: patientName,
                          decoration: InputDecoration(
                            labelText: 'Bloob Pressure',
                            hintText: 'Enter BP (94 - 200 mmHg)',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ), // Change color when focused
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Keep rounded corners when focused
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextFormField(
                          controller: patientName,
                          decoration: InputDecoration(
                            labelText: 'Cholesterol',
                            hintText: 'Enter Cholesterol (126 - 564 mg/dl)',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ), // Change color when focused
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Keep rounded corners when focused
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align text and radio buttons to start
                          children: [
                            Text('Fasting Blood Sugar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                        SizedBox(height: screenHeight * 0.02),
                        TextFormField(
                          controller: patientName,
                          decoration: InputDecoration(
                            labelText: 'Heart Rate',
                            hintText: 'Enter Max HR (71 - 202 bpm)',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ), // Change color when focused
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Keep rounded corners when focused
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align text and radio buttons to start
                          children: [
                            Text('Exercise-Induced Angina', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                        TextFormField(
                          controller: patientName,
                          decoration: InputDecoration(
                            labelText: 'ST Depression Induced by Exercise',
                            hintText: 'Enter Old-peak (0.0 - 6.2)',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.lightGreen,
                                width: 2,
                              ), // Default border color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ), // Change color when focused
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Keep rounded corners when focused
                            ),
                          ),
                          keyboardType: TextInputType.number,
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
