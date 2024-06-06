import 'package:e_klinik_pens/authentication/service_auth.dart';
import 'package:e_klinik_pens/models/users.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    if (userId != null) {
      try {
        final user = await ServiceAuth().getUserById(userId);
        setState(() {
          _user = user;
        });
      } catch (e) {
        print('Failed to load user data: $e');
      }
    } else {
      print('User ID not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 35).r,
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        _user != null ? "Hello ${_user!.name}!" : "",
                        style: TextStyle(
                            fontSize: 32.sp,
                            color: pureWhite,
                            fontFamily: 'Inter-Semi'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 45.w,
                      height: 45.h,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            "assets/images/profiles-pic.jpg",
                          )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Cek Hasil rekam medismu',
                  style: TextStyle(fontSize: 16.sp, color: pureWhite),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
