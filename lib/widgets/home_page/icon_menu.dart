import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/home_page/doctor_profile_detail.dart';
import 'package:e_klinik_pens/widgets/home_page/gejala_diagnosa_detail.dart';
import 'package:e_klinik_pens/widgets/home_page/saran_masukan_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconMenu extends StatelessWidget {
  const IconMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      padding: const EdgeInsets.only(left: 35.0, right: 35, top: 40).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIconWithDescription(
            assetPath: "assets/images/icon_doctor.svg",
            description: "Dokter",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorProfileDetail(),
              ),
            ),
          ),
          _buildIconWithDescription(
            assetPath: "assets/images/icon_gejala_diagnosa.svg",
            description: "Gejala &\nDiagnosa",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GejalaDiagnosaDetail(),
              ),
            ),
          ),
          _buildIconWithDescription(
            assetPath: "assets/images/icon_saran_masukan.svg",
            description: "Saran &\nMasukan",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SaranMasukanDetail(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithDescription({
    required String assetPath,
    required String description,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: pureWhite,
                borderRadius: BorderRadius.all(Radius.circular(20).w),
                boxShadow: [
                  BoxShadow(
                    color: dark.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0).r,
                child: _buildSvgIcon(assetPath),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0).w,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSvgIcon(String assetPath) {
    return SvgPicture.asset(
      assetPath,
      width: 40.w,
      height: 43.h,
    );
  }
}
