import 'package:e_klinik_pens/models/gejala_diagnosa_list.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestDoctorDetails extends StatefulWidget {
  const BestDoctorDetails({super.key});

  @override
  State<BestDoctorDetails> createState() => _BestDoctorDetailsState();
}

class _BestDoctorDetailsState extends State<BestDoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      color: pureWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8).r,
      ),
      margin: const EdgeInsets.all(8.0).r,
      child: Padding(
        padding: const EdgeInsets.all(8.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: AssetImage(doctor.icon.toString()),
                    height: 100.w,
                    width: 100.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: TextStyle(
                          color: blackText,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        doctor.role,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0).w,
              child: Text(
                'Deskripsi:',
                style: TextStyle(
                  color: blackText,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Text(
              doctor.desc.toString(),
              style: TextStyle(
                color: textColor,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}