import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/link.dart';

class DoctorBanner extends StatelessWidget {
  const DoctorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final websiteUri= Uri.parse('https://www.pens.ac.id/2018/10/26/klinik-pens-sarana-berobat-gratis/');
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20).r,
      child: Container(
        height: 120.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: aquaHaze
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/banner.png")
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 100, bottom: 20).r,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "Klinik PENS, sarana berobat gratis",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Link(
                          uri: websiteUri,
                          target: LinkTarget.defaultTarget, 
                          builder: (context, openLink) => InkWell(
                            onTap: openLink,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: themeDark
                              ),
                              child: Text(
                                "Baca selengkapnya", 
                                style: TextStyle(
                                  color: pureWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}