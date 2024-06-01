import 'package:e_klinik_pens/models/schedule_doctor_list.dart';
import 'package:e_klinik_pens/pages/user/medical_record_history.dart';
import 'package:e_klinik_pens/pages/user/profile_page.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/common/double_tap_close.dart';
import 'package:e_klinik_pens/widgets/common/schedule_doctor.dart';
import 'package:e_klinik_pens/widgets/home_page/user_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarBottomUser extends StatefulWidget {
  const NavbarBottomUser({super.key});

  @override
  State<NavbarBottomUser> createState() => _NavbarBottomUserState();
}

class _NavbarBottomUserState extends State<NavbarBottomUser> {
  int currentTab = 0;

  final List<Widget> screens = [
    const HomePageUser(),
     ScheduleDoctorScreen(scheduleDoctors: scheduleDoctors),
    const MedicalHistory(),
    const ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePageUser();

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
            child: Container(
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
                        currentScreen = const HomePageUser();
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
                        currentScreen = const MedicalHistory();
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
