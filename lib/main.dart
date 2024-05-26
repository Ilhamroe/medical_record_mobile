import 'package:e_klinik_pens/models/camera_actions.dart';
import 'package:e_klinik_pens/pages/admin/data_dokter.dart';
import 'package:e_klinik_pens/pages/admin/data_pasien.dart';
import 'package:e_klinik_pens/pages/admin/edit_akun.dart';
import 'package:e_klinik_pens/pages/admin/pasien_terakhir_berkunjung.dart';
import 'package:e_klinik_pens/pages/admin/profile.dart';
import 'package:e_klinik_pens/pages/admin/tambah_akun.dart';
import 'package:e_klinik_pens/widgets/expansion/expansion.dart';
import 'package:e_klinik_pens/widgets/tambahan/sukses.dart';
import 'package:flutter/material.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: PasienTerakhirBerkunjung(),
    );
  }
}