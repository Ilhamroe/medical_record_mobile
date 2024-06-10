import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/models/doctor_list.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCardDetail extends StatefulWidget {
  const DoctorCardDetail({super.key});

  @override
  State<DoctorCardDetail> createState() => _DoctorCardDetailState();
}

class _DoctorCardDetailState extends State<DoctorCardDetail> {
  final ServiceAuth _serviceAuth = ServiceAuth();
  late Future<List<User>> listData;

  @override
  void initState() {
    super.initState();
    listData = _serviceAuth.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: listData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else if (snapshot.hasData) {
          List<User> users = snapshot.data!;
          List<User> doctors =
              users.where((user) => user.role == 'dokter').toList();
          return SingleChildScrollView(
            child: Column(
              children: doctors.map((dokter) {
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
                                image: AssetImage(
                                    'assets/images/avatar_doctor_3.png'),
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
                                    dokter.name,
                                    style: TextStyle(
                                      color: blackText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    "Dokter Umum",
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
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          dokter.description.toString(),
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        } else if (snapshot.hasError) {
          print('Snapshot error: ${snapshot.error}');
          return Text("Error: ${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class DoctorDetailListView extends StatelessWidget {
  const DoctorDetailListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: double.infinity),
      child: DoctorCardDetail());
  }
}
