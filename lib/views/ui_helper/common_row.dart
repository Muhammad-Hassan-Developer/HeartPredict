import 'package:flutter/material.dart';
class CommonRow extends StatelessWidget {
  final String heading;
  final dynamic value;
  const  CommonRow({super.key,required this.heading,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(heading,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        Text(value ?? 'N/A',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

