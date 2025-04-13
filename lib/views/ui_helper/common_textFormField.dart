import 'package:flutter/material.dart';

import 'color.dart';
class CommonTextFormField extends StatelessWidget {
  TextEditingController controller=TextEditingController();
  final String label,hint;
  final TextInputType keyboard;
  final FormFieldValidator<String>? validation;
  CommonTextFormField({super.key,required this.controller,required this.label,required this.hint,required this.keyboard,this.validation});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGreen,
            width: 2,
          ), // Default border color,
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ), // Change color when focused
          borderRadius: BorderRadius.circular(
            20,
          ), // Keep rounded corners when focused
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ), // Change color when focused
          borderRadius: BorderRadius.circular(
            20,
          ), // Keep rounded corners when focused
        ),
      ),
      keyboardType: keyboard,
      validator: validation,
    );
  }
}
