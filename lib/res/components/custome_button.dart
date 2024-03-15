import 'package:flutter/material.dart';
import 'package:test_grid/res/app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/15,
      width: double.infinity,
      margin: EdgeInsets.only(left: 10,right: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.blueColor,
          backgroundColor: AppColors.blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: AppColors.blueColor, width: 1),
          ),
        ),
        child: Text(buttonText,style: TextStyle(color: AppColors.textWhite),),
      ),
    );
  }
}
