import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_grid/res/app_colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final EdgeInsets margin;
  final Function(String) onChanged;
  final TextEditingController? controller;
  final TextInputFormatter? inputFormatter;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.margin,
    required this.onChanged,
    this.controller,
    this.inputFormatter,
    this.keyboardType= TextInputType.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blueColor),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: labelText,
          contentPadding: EdgeInsets.only(left: 15),
          border: InputBorder.none,
        ),
        onChanged: onChanged,
        inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
      ),
    );
  }
}
