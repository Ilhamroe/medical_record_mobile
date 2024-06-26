import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/home_page/suggestion_card_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaranMasukanDetail extends StatelessWidget {
  const SaranMasukanDetail({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: themeLight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/atomic.png"),
            ),
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.5).r,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              }, 
                              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                              color: pureWhite,
                              )
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Kritik & Saran",
                            style: TextStyle(
                              color: pureWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 14,
                  child: Container(
                    decoration: BoxDecoration(
                      color: pureWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35).w,
                        topRight: const Radius.circular(35).w,
                      ),
                    ),
                    child: SaranMasukanListView(),
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
