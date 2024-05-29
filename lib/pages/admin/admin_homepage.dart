import 'package:e_klinik_pens/models/homepages_tile.dart';
import 'package:e_klinik_pens/models/recent_patients.dart';
import 'package:e_klinik_pens/pages/doctor/doctor_homepage.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/doctor/recentPatients_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: themeLight,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/atomic.png"),
            ),
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35, top: 45).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Hello Admin!",
                              style: TextStyle(
                                color: pureWhite,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7.5).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Kelola akun & data rekam medis",
                                style: TextStyle(
                                  color: pureWhite,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(45).w,
                        topRight: const Radius.circular(45).w,
                      ),
                      color: pureWhite,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15).w,
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: adminTiles.length,
                              itemBuilder: (context, index) {
                                final adminTile = adminTiles[index];
                                return Ink(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10).r,
                                    child: InkWell(
                                      child: Card(
                                        color: pureWhite,
                                        surfaceTintColor: Colors.transparent,
                                        elevation: 2,
                                        child: ListTile(
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7.5).r,
                                          leading: adminTile.icon,
                                          horizontalTitleGap: 30.w,
                                          title: Text(
                                            adminTile.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                            ),
                                          ),
                                          subtitle: Text(
                                            adminTile.sub,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: themeDark,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(context, 
                                        MaterialPageRoute(builder: (context) => const DoctorHomePage()),
                                        );
                                      },
                                      
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20).r,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0).r,
                                    child: Text(
                                      "Pasien Terakhir Berkunjung",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const RecentPatientsTile(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
