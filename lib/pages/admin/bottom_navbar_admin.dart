import 'package:e_klinik_pens/pages/admin/home_page.admin.dart';
import 'package:e_klinik_pens/pages/common/reset_password.dart';
import 'package:e_klinik_pens/pages/common/test_page.dart';
import 'package:e_klinik_pens/pages/user/profile_page.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/common/double_tap_close.dart';
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
    const HomePageAdmin(),
    const TestPage(),
    const ResetPassword(),
    const ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePageAdmin();

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return DoubleBackToCloseApp(
      snackBarMessage: 'Tekan sekali lagi untuk keluar',
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                        currentScreen = const HomePageAdmin();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 0
                            ? Image.asset(
                                'assets/images/home1.png',
                                color: currentTab == 0 ? themeDark : navbar,
                              )
                            : Image.asset(
                                'assets/images/home2.png',
                                color: currentTab == 0 ? themeDark : navbar,
                              ),
                      ],
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
                        currentScreen = const TestPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 1
                            ? Image.asset(
                                'assets/images/calendar1.png',
                                color: currentTab == 1 ? themeDark : navbar,
                              )
                            : Image.asset(
                                'assets/images/calendar2.png',
                                color: currentTab == 1 ? themeDark : navbar,
                              ),
                      ],
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
                        currentScreen = const ResetPassword();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 2
                            ? Image.asset(
                                'assets/images/history1.png',
                                color: currentTab == 2 ? themeDark : navbar,
                              )
                            : Image.asset(
                                'assets/images/history2.png',
                                color: currentTab == 2 ? themeDark : navbar,
                              ),
                      ],
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 3
                            ? Image.asset(
                                'assets/images/profile1.png',
                                color: currentTab == 3 ? themeDark : navbar,
                              )
                            : Image.asset(
                                'assets/images/profile2.png',
                                color: currentTab == 3 ? themeDark : navbar,
                              ),
                      ],
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
