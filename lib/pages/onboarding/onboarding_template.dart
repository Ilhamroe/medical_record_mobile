import 'package:e_klinik_pens/models/onboarding_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentTemplate extends StatelessWidget {
  final OnBoardItems item;

  const ContentTemplate({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0).w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300.w,
            height: 300.h,
            child: Image.asset(item.image),
          ),
          SizedBox(height: 20.h),
          Text(
            item.title,
            style: TextStyle(
              fontFamily: 'Inter-Bold',
              fontSize: 24.sp,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
