import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customDivider(BuildContext context) {
  return Divider(
    indent: MediaQuery.of(context).size.width * 0.05,
    endIndent: MediaQuery.of(context).size.width * 0.05,
    color: aquaHaze,
  );
}

Widget customSpasi(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.03,
  );
}

class TextLabel extends StatefulWidget {
  final String label;
  const TextLabel({super.key, required this.label});

  @override
  State<TextLabel> createState() => _TextLabelState();
}

class _TextLabelState extends State<TextLabel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0).w,
      child: Text(
        widget.label,
        style: TextStyle(
          fontSize: 16.sp,
          fontFamily: 'Inter-Regular',
        ),
      ),
    );
  }
}
