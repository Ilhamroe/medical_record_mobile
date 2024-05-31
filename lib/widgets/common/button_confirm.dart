import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonConfirm extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color borderColor;
  final Color buttonColor;
  final Color colorText;
  final VoidCallback onPressed;
  final double borderRadius;

  const ButtonConfirm({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.borderColor,
    required this.buttonColor,
    required this.colorText,
    required this.onPressed,
    this.borderRadius = 32.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius).w,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter-Semi',
            fontSize: 16.sp,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
