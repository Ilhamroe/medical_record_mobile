import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/common/button_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlertConfirm extends StatefulWidget {
  final String descText;
  final String route;
  const AlertConfirm({required this.descText, required this.route, super.key});

  @override
  State<AlertConfirm> createState() => _AlertConfirmState();
}

class _AlertConfirmState extends State<AlertConfirm> {
  bool _isNavigated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!_isNavigated) {
        Navigator.pushNamed(context, widget.route);
      }
    });
  }

  void _navigateToLogin() {
    if (!_isNavigated) {
      _isNavigated = true;
      Navigator.pushNamed(context, widget.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: pureWhite,
      title: Center(
        child: Container(
          height: 70.h,
          width: 70.w,
          decoration: const BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/images/done.svg",
              width: 40.w,
              color: themeDark,
            ),
          ),
        ),
      ),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0).w,
              child: Text(
                "Sukses",
                style: TextStyle(
                  fontFamily: 'Inter-Bold',
                  fontSize: 22.sp,
                  color: dark,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              widget.descText,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.sp,
                color: onBoard,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0).w,
              child: ButtonConfirm(
                width: 160.w,
                height: 40.h,
                text: 'Masuk',
                colorText: pureWhite,
                borderColor: themeDark,
                buttonColor: themeDark,
                onPressed: _navigateToLogin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
