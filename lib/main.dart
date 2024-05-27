import 'package:e_klinik_pens/models/camera_actions.dart';
import 'package:e_klinik_pens/pages/admin/admin_homepage.dart';
import 'package:e_klinik_pens/pages/user/editcoba.dart';
import 'package:e_klinik_pens/pages/user/profile_page.dart';
import 'package:e_klinik_pens/pages/user/editProfile_page.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async{
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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: ProfilePage(),
      ),
    );
  }
}