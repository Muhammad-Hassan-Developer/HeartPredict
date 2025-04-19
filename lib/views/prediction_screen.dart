import 'dart:developer';

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
    log('Prediction Result: ${widget.predictionResult}');
    return Scaffold(
      appBar: AppBar(title: Text('Heart Disease Prediction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Result:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              widget.predictionResult,
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),

          ],
        ),
      ),
    );
  }
}
