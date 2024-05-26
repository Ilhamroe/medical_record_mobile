import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:e_klinik_pens/widgets/common/button_confirm.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  initState() {
    super.initState();
  }

  Future<void> whatsAppOpen() async {
    final String phone = "+6289603443665";
    final String message =
        "Halo Admin, saya tidak bisa mengakses akun saya karena lupa password, mohon bantuannya. Terima kasih";
    final String url =
        "https://wa.me/$phone?text=${Uri.encodeComponent(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        backgroundColor: pureWhite,
        appBar: AppBar(
          leading: Row(
            children: [
              Flexible(
                child: IconButton(
                  iconSize: Checkbox.width,
                  key: const Key('back'),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, AppRoutes.login);
                  },
                  padding: const EdgeInsets.only(left: 20).w,
                  icon: SvgPicture.asset(
                    "assets/images/back-button.svg",
                    width: 28.w,
                    height: 28.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 24.0).w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lupa Password Anda?",
                    style: TextStyle(fontFamily: 'Inter-Bold', fontSize: 24.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Hubungi nomor admin berikut ini untuk mereset password Anda :",
                      style: TextStyle(
                          fontFamily: 'Inter-Regular',
                          fontSize: 16.sp,
                          color: onBoard),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0).w,
              child: Text(
                "+6289603443665",
                style: TextStyle(
                  fontFamily: 'Inter-Medium',
                  fontSize: 24.sp,
                ),
              ),
            ),
            ButtonConfirm(
              width: 300.w,
              height: 50.h,
              text: 'Lanjutkan ke Chat',
              colorText: pureWhite,
              borderColor: themeDark,
              buttonColor: themeDark,
              onPressed: () async {
                try {
                  await whatsAppOpen();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch WhatsApp: $e')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
