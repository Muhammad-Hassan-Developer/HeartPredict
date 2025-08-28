import 'package:flutter/material.dart';
import 'package:heart_prediction/views/welcome_screen.dart';

class SplashViewModel extends ChangeNotifier {
  /// Start splash screen timer and navigate
  void startSplash(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    });
  }
}
