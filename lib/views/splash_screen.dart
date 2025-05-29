import 'package:flutter/material.dart';
import 'package:heart_prediction/views/ui_helper/color.dart';
import 'package:heart_prediction/views/ui_helper/heart_loader.dart';
import 'package:heart_prediction/views/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Future.delayed(Duration(seconds: 10), () {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned(
              left: width * 0.02,
              top: height * 0.60,
              child: Text(
                'Heart Disease Prediction',
                style: GoogleFonts.lobster(color: AppColors.lightRed, fontSize: 30),
              ),
            ),
            Positioned(
              left: width * 0.25,
              top: height * 0.30,
              child: Image.asset(
                'images/splashscreen.png',
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Positioned(
              right: width*.005,
              top: height * 0.30,
              child: heartBeatLoader(),
            ),
          ],
        ),
      ),
    );
  }}
