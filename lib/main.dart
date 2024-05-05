import 'package:e_klinik_pens/models/camera_actions.dart';
import 'package:e_klinik_pens/pages/profile_page.dart';
import 'package:e_klinik_pens/pages/editProfile_page.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/pages/cek.dart';
import 'package:camera/camera.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  cameras= await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: ProfilePage(),
    );
  }
}