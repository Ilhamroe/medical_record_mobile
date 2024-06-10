import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/models/homepages_tile.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/pages/admin/add_account.dart';
import 'package:e_klinik_pens/pages/admin/doctors_data.dart';
import 'package:e_klinik_pens/pages/admin/patients_data.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/doctor/recentPatients_tile.dart';
import 'package:e_klinik_pens/widgets/home_page/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({Key? key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  late Future<List<User>> _usersFuture;
  final ServiceAuth _serviceAuth = ServiceAuth();

  @override
  void initState() {
    super.initState();
    _usersFuture = _serviceAuth.getAllUsers();
  }

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
                const Header(),
                Expanded(
                  flex: 9,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35).w,
                        topRight: const Radius.circular(35).w,
                      ),
                      color: pureWhite,
                    ),
                    child: SingleChildScrollView(
                      child: FutureBuilder<List<User>>(
                        future: _usersFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text('No user data available.'),
                            );
                          } else {
                            final List<User> users = snapshot.data!;
                            final int numberOfPatients = users
                                .where((user) => user.role == 'user')
                                .length;
                            final int numberOfDoctors = users
                                .where((user) => user.role == 'dokter')
                                .length;

                            List<AdminTile> adminTiles = [
                              AdminTile(
                                icon: Image.asset("assets/images/doctor.png"),
                                title: numberOfPatients.toString(),
                                sub: "Data Pasien",
                                onTap: (context) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DataPasien()));
                                },
                              ),
                              AdminTile(
                                icon: Image.asset(
                                    "assets/images/profile-big.png"),
                                title: numberOfDoctors.toString(),
                                sub: "Data Dokter",
                                onTap: (context) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DataDokter()));
                                },
                              ),
                              AdminTile(
                                icon: Image.asset("assets/images/add-acc.png"),
                                title: "Tambah Akun ",
                                sub: "Pasien / Dokter",
                                onTap: (context) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TambahAkun()));
                                },
                              )
                            ];

                            return Column(
                              children: [
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: adminTiles.length,
                                  itemBuilder: (context, index) {
                                    final adminTile = adminTiles[index];
                                    return Ink(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                                left: 21.75,
                                                right: 21.75,
                                                bottom: 10)
                                            .r,
                                        child: InkWell(
                                          child: Card(
                                            color: pureWhite,
                                            surfaceTintColor:
                                                Colors.transparent,
                                            elevation: 2,
                                            child: ListTile(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                          horizontal: 30,
                                                          vertical: 7.5)
                                                      .r,
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
                                          onTap: () => adminTile.onTap(context),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const RecentPatientsTile(),
                              ],
                            );
                          }
                        },
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
