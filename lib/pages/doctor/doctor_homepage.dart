import 'package:e_klinik_pens/models/homepages_tile.dart';
import 'package:e_klinik_pens/models/recent_patients.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/link.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
final websiteUri= Uri.parse('https://www.pens.ac.id/2018/10/26/klinik-pens-sarana-berobat-gratis/');

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
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Hello Dokter!",
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                  color: pureWhite
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
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                      image: AssetImage("assets/images/profiles-pic.jpg")
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Lihat daftar pasienmu!",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: pureWhite
                            ),
                            ),
                          ],
                        )
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
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: doctorTiles.length,
                            itemBuilder: (context, index){
                              final doctorTile= doctorTiles[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25.0).r,
                                child: Card(
                                  surfaceTintColor: Colors.transparent,
                                  elevation: 2,
                                  color: pureWhite,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
                                    leading: doctorTile.icon,
                                    title: Text(doctorTile.title)
                                  )
                                ),
                              );
                            }
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0, right: 35, top: 20).r,
                            child: Container(
                              height: 120.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: aquaHaze
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Image.asset("assets/images/banner.png")
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20, left: 20, right: 100, bottom: 20).r,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "Klinik PENS, sarana berobat gratis",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.sp
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10).r,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Link(
                                                uri: websiteUri,
                                                target: LinkTarget.defaultTarget, 
                                                builder: (context, openLink) => InkWell(
                                                  onTap: openLink,
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(35),
                                                      color: themeDark
                                                    ),
                                                    child: Text(
                                                      "Baca selengkapnya", 
                                                      style: TextStyle(
                                                        color: pureWhite,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 13.sp
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 15, right: 15).r,
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
                                SizedBox(
                                  height: 135.h, 
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: recentPatients.length,
                                    itemBuilder: (context, index) {
                                      final recentPatient = recentPatients[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 10, top: 10).r,
                                        child: Container(
                                          width: 105.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              color: aquaHaze,
                                            )
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10, right: 10, top: 10).r,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: 70.w,
                                                  height: 70.w,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: Image(
                                                      image: AssetImage(recentPatient.profilePhoto),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0).r,
                                                  child: SizedBox(
                                                    height: 20.h,
                                                    child: Marquee(
                                                      text: recentPatient.name,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight: FontWeight.w500
                                                        ),
                                                      scrollAxis: Axis.horizontal,
                                                      blankSpace: 30.0,
                                                      velocity: 50.0,
                                                      pauseAfterRound: const Duration(seconds: 1),
                                                      accelerationDuration: const Duration(seconds: 1),
                                                      accelerationCurve: Curves.linear,
                                                      decelerationDuration: const Duration(milliseconds: 500),
                                                      decelerationCurve: Curves.easeOut,
                                                    ),
                                                  ),
                                                ),
                                                Text(recentPatient.nrp,
                                                style: const TextStyle(
                                                  color: navbar
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}