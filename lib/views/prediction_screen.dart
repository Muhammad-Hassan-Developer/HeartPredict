import 'package:flutter/material.dart';

class PredictionScreen extends StatefulWidget {
  final String predictionResult;

  const PredictionScreen({super.key, required this.predictionResult});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heart Disease Predictor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Prediction Result:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              widget.predictionResult,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
