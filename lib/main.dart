import 'package:e_klinik_pens/models/camera_actions.dart';
import 'package:e_klinik_pens/pages/common/login_register.dart';
import 'package:e_klinik_pens/pages/doctor/bottom_navbar_doctor.dart';
import 'package:e_klinik_pens/pages/doctor/doctor_homepage.dart';
import 'package:e_klinik_pens/pages/user/bottom_navbar_user.dart';
import 'package:e_klinik_pens/pages/user/profile_page.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_klinik_pens/utils/color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras= await availableCameras();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: pureWhite),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        // initialRoute: AppRoutes.splash,
        // onGenerateRoute: AppRoutes.generateRoute,
        home: NavbarBottomUser(),
      ),
    );
  }
}
