import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/home_page/header.dart';
import 'package:e_klinik_pens/widgets/home_page/menu.dart';
import 'package:flutter/material.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({super.key,});

  @override
  State<HomePageUser> createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: themeLight,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/atomic.png',
              ),
            ),
            const Column(
              children: [
                SizedBox(height: 20),
                Header(),
                Menu(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
