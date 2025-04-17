import 'package:flutter/material.dart';
import 'package:heart_prediction/views/prediction_screen.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/welcome_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
@override
void initState() {
  super.initState();
  Future.delayed(Duration(seconds: 5), () {
    if (mounted) { // ✅ Check to avoid navigation if widget is disposed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset('images/splashscreen.png',fit: BoxFit.cover,height: 150,),
            const Text(
              'Heart Disease Prediction',
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: AppColors.lightGreen),
            ),
          ],
        ),
      ));
  }
}
