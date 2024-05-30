import 'package:e_klinik_pens/models/homepages_tile.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/doctor/doctor_banner.dart';
import 'package:e_klinik_pens/widgets/doctor/recentPatients_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
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
                    padding: const EdgeInsets.only(left: 26, right: 26, top: 45).r,
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
                        topLeft: const Radius.circular(30).w,
                        topRight: const Radius.circular(30).w,
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
                          const DoctorBanner(),
                          const RecentPatientsTile(), 
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