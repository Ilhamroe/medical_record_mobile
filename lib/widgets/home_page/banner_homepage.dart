import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:e_klinik_pens/utils/color.dart';

class BannerHomepage extends StatelessWidget {
  BannerHomepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).w,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.all(20).w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              color: aquaHaze,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Klinik Pens, Sarana \nberobat gratis',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10).w,
                      ),
                      StatefulBuilder(
                        // Use StatefulBuilder for state management
                        builder: (context, setState) => InkWell(
                          onTap: () {
                            setState(
                                () => _isButtonPressed = !_isButtonPressed);
                            _launchURL();
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30).w,
                              color: _isButtonPressed
                                  ? themeDark.withOpacity(0.7)
                                  : themeDark,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10).w,
                            child: Text(
                              'Baca selengkapnya',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/doctor_banner.png',
                      width: 100.w,
                      height: 140.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    const String url =
        'https://www.pens.ac.id/2018/10/26/klinik-pens-sarana-berobat-gratis/';
    Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw Exception('Cannot Launch');
    }
  }

  bool _isButtonPressed = false;
}
