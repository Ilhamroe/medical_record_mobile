import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/doctor/doctor_banner.dart';
import 'package:e_klinik_pens/widgets/user/best_doctor_tiles.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/widgets/home_page/icon_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        decoration: BoxDecoration(
          color: pureWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.r),
            topRight: Radius.circular(35.r),
          ),
        ),
        child: const Column(
          children: [
            IconMenu(),
            DoctorBanner(),
            BestDoctorTile(),
          ],
        ),
      ),
    );
  }
}
