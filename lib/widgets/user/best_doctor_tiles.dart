import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';

class BestDoctorTile extends StatefulWidget {
  const BestDoctorTile({super.key});

  @override
  State<BestDoctorTile> createState() => _BestDoctorTileState();
}

class _BestDoctorTileState extends State<BestDoctorTile> {
  final ServiceAuth _serviceAuth = ServiceAuth();
  late Future<List<User>> listData;

  @override
  void initState() {
    super.initState();
    listData = _serviceAuth.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 23.5, right: 23.5).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dokter Terbaik",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 135.h,
            child: FutureBuilder<List<User>>(
              future: listData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  List<User> users = snapshot.data!;
                  List<User> doctors =
                      users.where((user) => user.role == 'dokter').toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctorTile = doctors[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10).r,
                        child: Container(
                          width: 105.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: aquaHaze),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10)
                                .r,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 60.w,
                                  height: 60.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: Image.asset(
                                        'assets/images/avatar_doctor_3.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0).r,
                                  child: SizedBox(
                                    height: 20.h,
                                    child: Marquee(
                                      text: doctorTile.name,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      scrollAxis: Axis.horizontal,
                                      blankSpace: 30.0,
                                      velocity: 50.0,
                                      pauseAfterRound:
                                          const Duration(seconds: 1),
                                      accelerationDuration:
                                          const Duration(seconds: 1),
                                      accelerationCurve: Curves.linear,
                                      decelerationDuration:
                                          const Duration(milliseconds: 500),
                                      decelerationCurve: Curves.easeOut,
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Dokter Umum",
                                    style: const TextStyle(color: navbar),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
