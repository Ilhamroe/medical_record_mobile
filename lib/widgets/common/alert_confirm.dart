import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/common/button_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlertConfirmation extends StatefulWidget {
  final String titleText;
  final String descText;
  final String route;
  final String userId;

  const AlertConfirmation({
    required this.titleText,
    required this.descText,
    required this.route,
    required this.userId,
    super.key,
  });

  @override
  State<AlertConfirmation> createState() => _AlertConfirmationState();
}

class _AlertConfirmationState extends State<AlertConfirmation> {
  bool _isNavigated = false;
  final ServiceAuth serviceAPI = ServiceAuth();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _navigateToPage() async {
    if (!_isNavigated) {
      _isNavigated = true;
      try {
        await serviceAPI.deleteUser(widget.userId);
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete user: $e')),
        );
      }
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
                widget.titleText,
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
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 7.0)
                      .w,
                  child: ButtonConfirm(
                    width: 100.w,
                    height: 40.h,
                    text: 'Batal',
                    colorText: themeDark,
                    borderColor: themeDark,
                    buttonColor: pureWhite,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 7.0)
                      .w,
                  child: ButtonConfirm(
                    width: 100.w,
                    height: 40.h,
                    text: 'Hapus',
                    colorText: pureWhite,
                    borderColor: themeDark,
                    buttonColor: themeDark,
                    onPressed: _navigateToPage,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
