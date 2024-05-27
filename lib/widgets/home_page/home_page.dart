import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/home_page/header.dart';
import 'package:e_klinik_pens/widgets/home_page/menu.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/widgets/home_page/banner_homepage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: themeLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/atomic.png',
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 20),
                  Header(),
                  Menu(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
