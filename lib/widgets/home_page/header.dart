import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
   const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 35).r,
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Mirta!',
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: pureWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 45.w,
                      height: 45.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(
                          "assets/images/profiles-pic.jpg",
                        )
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Cek Hasil rekam medismu',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: pureWhite
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}