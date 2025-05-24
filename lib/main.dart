import 'package:flutter/material.dart';
import 'package:heart_prediction/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:heart_prediction/views/ui_helper/heart_loader.dart';
import 'package:heart_prediction/views/view_components/heart_rate_tester.dart';

import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //color: Colors.white,
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class HeartbeatAnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Heartbeat Animation'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: heartBeatLoader()
      ),
    );
  }
}

