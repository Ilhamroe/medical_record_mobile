import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/pages/admin/doctors_data.dart';
import 'package:e_klinik_pens/pages/admin/patients_data.dart';
import 'package:e_klinik_pens/pages/admin/add_account.dart';
import 'package:e_klinik_pens/pages/doctor/add_medical_history.dart';
import 'package:e_klinik_pens/pages/doctor/tambah_rekam_medis.dart';
import 'package:e_klinik_pens/pages/user/editProfile_page.dart';
import 'package:e_klinik_pens/pages/user/faq_page.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/pages/doctor/add_medical_history.dart';
import 'package:e_klinik_pens/pages/doctor/patients_data_doctor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminTile {
  Image icon;
  String title;
  String sub;
  final Function(BuildContext context) onTap;

  AdminTile(
      {required this.icon,
      required this.title,
      required this.sub,
      required this.onTap});
}

List<AdminTile> adminTiles = [
  AdminTile(
    icon: Image.asset("assets/images/doctor.png"),
    title: "3",
    sub: "Data Pasien",
    onTap: (context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DataPasien()));
    },
  ),
  AdminTile(
    icon: Image.asset("assets/images/profile-big.png"),
    title: "69",
    sub: "Data Dokter",
    onTap: (context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DataDokter()));
    },
  ),
  AdminTile(
    icon: Image.asset("assets/images/add-acc.png"),
    title: "Tambah Akun ",
    sub: "Pasien / Dokter",
    onTap: (context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TambahAkun()));
    },
  )
];

class DoctorTile {
  final Image icon;
  final String title;
  final Function(BuildContext context) onTap;

  const DoctorTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

final List<DoctorTile> doctorTiles = [
  DoctorTile(
    icon: Image.asset("assets/images/profile-big.png"),
    title: "Pasien",
    onTap: (context) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DataPasienDoctor())),
  ),
  DoctorTile(
      icon: Image.asset("assets/images/medical-record.png"),
      title: "Tambah Rekam Medis",
      onTap: (context) => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TambahRekamMedisPage()))),
];

class ProfileTile {
  final Widget text;
  final Widget leading;
  final Widget trailing;
  final Function(BuildContext context) onTap;

  const ProfileTile({
    required this.text,
    required this.leading,
    required this.trailing,
    required this.onTap,
  });
}

final List<ProfileTile> profileTiles = [
  ProfileTile(
    text: Text(
      "Profil",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
    ),
    leading: const CircleAvatar(
      backgroundColor: aquaHaze,
      child: Image(
        image: AssetImage("assets/images/profile-tile.png"),
      ),
    ),
    trailing: Image.asset("assets/images/arrow.png"),
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditProfile()),
      );
    },
  ),
  ProfileTile(
    text: Text(
      "FAQ",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
    ),
    leading: const CircleAvatar(
      backgroundColor: aquaHaze,
      child: Image(
        image: AssetImage("assets/images/faq.png"),
      ),
    ),
    trailing: Image.asset("assets/images/arrow.png"),
    onTap: (context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const FaqPage()));
    },
  ),
  ProfileTile(
    text: Text("Keluar",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16.sp, color: danger)),
    leading: const CircleAvatar(
        backgroundColor: aquaHaze,
        child: Image(
          image: AssetImage("assets/images/exit.png"),
        )),
    trailing: Image.asset("assets/images/arrow.png"),
    onTap: (context) {
      final ServiceAuth _logoutService = ServiceAuth();
      _logoutService.logoutUser(context);
    },
  ),
];
