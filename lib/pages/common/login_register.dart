import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:e_klinik_pens/widgets/common/button_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logoKlinik.png',
              height: 100.h,
              color: themeDark,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0).w,
              child: Column(
                children: [
                  Text(
                    "Mari Mulai Sekarang!",
                    style: TextStyle(
                      fontFamily: 'Inter-Bold',
                      fontSize: 23.sp,
                      // color: onBoard,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 60.0).w,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Silahkan masuk untuk menikmati\nfitur yang kami sediakan ",
                      style: TextStyle(
                        fontFamily: 'Inter-Regular',
                        fontSize: 19.sp,
                        color: textColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0).w,
                    child: ButtonConfirm(
                      width: 270.w,
                      height: 50.h,
                      text: 'Masuk',
                      colorText: pureWhite,
                      borderColor: themeDark,
                      buttonColor: themeDark,
                      onPressed: () {
                        Navigator.popAndPushNamed(context, AppRoutes.login);
                      },
                    ),
                  ),
                  ButtonConfirm(
                    width: 270.w,
                    height: 50.h,
                    text: 'Daftar',
                    colorText: themeDark,
                    borderColor: themeDark,
                    buttonColor: pureWhite,
                    onPressed: () {
                      Navigator.popAndPushNamed(context, AppRoutes.register);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
