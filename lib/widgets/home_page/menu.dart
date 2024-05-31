import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/widgets/home_page/banner_homepage.dart';
import 'package:e_klinik_pens/widgets/home_page/icon_menu.dart'; 
import 'package:e_klinik_pens/widgets/home_page/doctor_card.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: onBoard,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
         children: [
           IconMenu(),
          BannerHomepage(), 
          DoctorListView()
        ],
      ),
    );
  }
}
