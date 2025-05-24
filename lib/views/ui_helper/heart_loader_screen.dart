import 'package:flutter/material.dart';

import 'heart_loader.dart';

class HeartLoaderScreen extends StatelessWidget {
  const HeartLoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: heartBeatLoader()),
      ),
    );
  }
}
