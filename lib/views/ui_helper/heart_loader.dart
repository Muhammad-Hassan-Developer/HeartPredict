import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

 Widget heartBeatLoader(){
  return Lottie.asset(
  'images/beat.json',  // Path to your downloaded Lottie file
  width: 400,
height: 400,
repeat: true,
animate: true,
);
}