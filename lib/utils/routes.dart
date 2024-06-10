import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/pages/admin/admin_homepage.dart';
import 'package:e_klinik_pens/pages/admin/data_dokter.dart';
import 'package:e_klinik_pens/pages/admin/data_pasien.dart';
import 'package:e_klinik_pens/pages/admin/edit_akun.dart';
import 'package:e_klinik_pens/pages/admin/tambah_akun.dart';
import 'package:e_klinik_pens/pages/common/login_register.dart';
import 'package:e_klinik_pens/pages/common/login.dart';
import 'package:e_klinik_pens/pages/common/register.dart';
import 'package:e_klinik_pens/pages/common/reset_password.dart';
import 'package:e_klinik_pens/pages/common/test_page.dart';
import 'package:e_klinik_pens/pages/doctor/bottom_navbar_doctor.dart';
import 'package:e_klinik_pens/pages/doctor/doctor_homepage.dart';
import 'package:e_klinik_pens/pages/onboarding/onboarding_page.dart';
import 'package:e_klinik_pens/pages/onboarding/splash.dart';
import 'package:e_klinik_pens/pages/admin/bottom_navbar_admin.dart';
import 'package:e_klinik_pens/pages/user/bottom_navbar_user.dart';
import 'package:e_klinik_pens/pages/user/profile_page.dart';
import 'package:flutter/material.dart';

User? user;

class AppRoutes {
  static const String splash = "/";
  static const String onboard = "/onboard";
  static const String logreg = "/logreg";
  static const String login = "/login";
  static const String register = "/register";
  static const String resetpw = "/resetpw";
  static const String navbarAdmin = "/navbarAdmin";
  static const String navbarDokter = "/navbarDokter";
  static const String navbarUser = "/navbarUser";
  static const String homeadmin = "/home";
  static const String homedokter = "/dokter";
  static const String homeuser = "/user";
  static const String tes = "/tes";
  static const String addAkun = "/addAkun";
  static const String dataPasien = "/dataPasien";
  static const String dataDokter = "/dataDokter";
  static const String editAkun = "/editAkun";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );

      case AppRoutes.tes:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TestPage(),
        );

      case AppRoutes.onboard:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardingPage(),
        );

      case AppRoutes.logreg:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginRegisterPage(),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginPage(),
        );

      case AppRoutes.register:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegisterPage(),
        );

      case AppRoutes.resetpw:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ResetPassword(),
        );

      case AppRoutes.editAkun:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EditAkun(
            userId: "$user.id",
          ),
        );

      case AppRoutes.addAkun:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TambahAkun(),
        );
      case AppRoutes.dataPasien:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DataPasien(),
        );

      case AppRoutes.dataDokter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DataDokter(),
        );

      case AppRoutes.navbarAdmin:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavbarBottomAdmin(),
        );

      case AppRoutes.navbarDokter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavbarBottomDoctor(),
        );

      case AppRoutes.navbarUser:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavbarBottomUser(),
        );

      case AppRoutes.homeadmin:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AdminHomepage(),
        );

      case AppRoutes.homedokter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DoctorHomePage(),
        );

      case AppRoutes.homeuser:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProfilePage(),
        );

      default:
        return _errorRoute(settings);
    }
  }

  static MaterialPageRoute _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
