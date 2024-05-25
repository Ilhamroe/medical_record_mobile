import 'package:e_klinik_pens/pages/admin/home_page.admin.dart';
import 'package:e_klinik_pens/pages/common/login_register.dart';
import 'package:e_klinik_pens/pages/common/login.dart';
import 'package:e_klinik_pens/pages/common/register.dart';
import 'package:e_klinik_pens/pages/common/reset_password.dart';
import 'package:e_klinik_pens/pages/doctor/home_page_doctor.dart';
import 'package:e_klinik_pens/pages/onboarding/onboarding_page.dart';
import 'package:e_klinik_pens/pages/onboarding/splash.dart';
import 'package:e_klinik_pens/widgets/common/bottom_navbar.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onboard = "/onboard";
  static const String logreg = "/logreg";
  static const String login = "/login";
  static const String register = "/register";
  static const String resetpw = "/resetpw";
  static const String navbar = "/navbar";
  static const String homeadmin = "/home";
  static const String homedokter = "/dokter";
  static const String homeuser = "/user";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
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

      case AppRoutes.navbar:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavbarBottom(),
        );

      case AppRoutes.homeadmin:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomePageAdmin(),
        );

      case AppRoutes.homedokter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomePageDoctor(),
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
