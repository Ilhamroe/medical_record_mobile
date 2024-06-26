import 'package:e_klinik_pens/models/schedule_doctor_list.dart';
import 'package:e_klinik_pens/pages/admin/admin_homepage.dart';
import 'package:e_klinik_pens/pages/admin/medical_record_history_admin.dart';
import 'package:e_klinik_pens/pages/user/profile_page.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/common/double_tap_close.dart';
import 'package:e_klinik_pens/widgets/common/schedule_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarBottomAdmin extends StatefulWidget {
  const NavbarBottomAdmin({super.key});

  @override
  State<NavbarBottomAdmin> createState() => _NavbarBottomAdminState();
}

class _NavbarBottomAdminState extends State<NavbarBottomAdmin> {
  int currentTab = 0;
  final List<Widget> screens = [
    const AdminHomepage(),
    ScheduleDoctorScreen(scheduleDoctors: scheduleDoctors),
    const MedicalHistoryAdmin(),
    const ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const AdminHomepage();

  @override
  Widget build(BuildContext context) {
    return DoubleBackToCloseApp(
      snackBarMessage: 'Tekan sekali lagi untuk keluar',
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: Container(
          height: 64.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2.r,
                blurRadius: 4.r,
              ),
            ],
          ),
          child: BottomAppBar(
            elevation: 3.0.r,
            color: pureWhite,
            surfaceTintColor: Colors.transparent,
            child: SizedBox(
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    highlightColor: pureWhite,
                    focusColor: pureWhite,
                    hoverColor: pureWhite,
                    disabledColor: pureWhite,
                    splashColor: pureWhite,
                    onPressed: () {
                      setState(() {
                        currentScreen = const AdminHomepage();
                        currentTab = 0;
                      });
                    },
                    child: currentTab == 0
                        ? Image.asset(
                            'assets/images/home1.png',
                            color: currentTab == 0 ? themeDark : navbar,
                          )
                        : Image.asset(
                            'assets/images/home2.png',
                            color: currentTab == 0 ? themeDark : navbar,
                          ),
                  ),
                  MaterialButton(
                    highlightColor: pureWhite,
                    focusColor: pureWhite,
                    hoverColor: pureWhite,
                    disabledColor: pureWhite,
                    splashColor: pureWhite,
                    onPressed: () {
                      setState(() {
                        currentScreen = ScheduleDoctorScreen(scheduleDoctors: scheduleDoctors);
                        currentTab = 1;
                      });
                    },
                    child: currentTab == 1
                        ? Image.asset(
                            'assets/images/calendar1.png',
                            color: currentTab == 1 ? themeDark : navbar,
                          )
                        : Image.asset(
                            'assets/images/calendar2.png',
                            color: currentTab == 1 ? themeDark : navbar,
                          ),
                  ),
                  MaterialButton(
                    highlightColor: pureWhite,
                    focusColor: pureWhite,
                    hoverColor: pureWhite,
                    disabledColor: pureWhite,
                    splashColor: pureWhite,
                    onPressed: () {
                      setState(() {
                        currentScreen = const MedicalHistoryAdmin();
                        currentTab = 2;
                      });
                    },
                    child: currentTab == 2
                        ? Image.asset(
                            'assets/images/history1.png',
                            color: currentTab == 2 ? themeDark : navbar,
                          )
                        : Image.asset(
                            'assets/images/history2.png',
                            color: currentTab == 2 ? themeDark : navbar,
                          ),
                  ),
                  MaterialButton(
                    highlightColor: pureWhite,
                    focusColor: pureWhite,
                    hoverColor: pureWhite,
                    disabledColor: pureWhite,
                    splashColor: pureWhite,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ProfilePage();
                        currentTab = 3;
                      });
                    },
                    child: currentTab == 3
                        ? Image.asset(
                            'assets/images/profile1.png',
                            color: currentTab == 3 ? themeDark : navbar,
                          )
                        : Image.asset(
                            'assets/images/profile2.png',
                            color: currentTab == 3 ? themeDark : navbar,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
