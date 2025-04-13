import 'package:flutter/material.dart';
import 'package:heart_prediction/apis/basic/all_apis/all_apis.dart';
class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  String predictionResult='' ;

  Future<void> predictHeartDisease() async {
    final result = await AllApis.predictHeartDiseaseApi();
    setState(() {
      if(result=='1'){
        predictionResult = 'Yes, the patient has heart disease.';
      }else{
        predictionResult = 'No, the patient does not have heart disease.';
      }

    });
  }
  @override
  Widget build(BuildContext context) {
         return Scaffold(
      appBar: AppBar(title: Text('Heart Disease Predictor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: predictHeartDisease,
              child: Text('Predict'),
            ),
            SizedBox(height: 20),
            Text(predictionResult),
          ],
        ),
      ),
    );
  }
}
