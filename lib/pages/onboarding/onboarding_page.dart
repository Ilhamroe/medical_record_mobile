import 'package:e_klinik_pens/models/onboarding_items.dart';
import 'package:e_klinik_pens/pages/onboarding/onboarding_template.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int selectedIndex = 0;
  late PageController controller;

  @override
  void initState() {
    controller =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 40.0).r,
            child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, AppRoutes.logreg);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontFamily: 'Inter-Regular',
                      fontSize: 15.sp,
                      color: onBoard),
                )),
          )
        ],
        surfaceTintColor: pureWhite,
        backgroundColor: pureWhite,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              pureWhite,
              pureWhite,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: OnboardData.onBoardItemList.length,
                controller: controller,
                onPageChanged: (v) {
                  setState(() {
                    selectedIndex = v;
                  });
                },
                itemBuilder: (context, index) {
                  return ContentTemplate(
                      item: OnboardData.onBoardItemList[index]);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      OnboardData.onBoardItemList.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.linear,
                        height: 5.h,
                        width: 16.w,
                        margin: const EdgeInsets.only(right: 5).r,
                        decoration: BoxDecoration(
                            color:
                                selectedIndex == index ? themeDark : themeLight,
                            borderRadius: BorderRadius.circular(8).w),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (selectedIndex <
                          OnboardData.onBoardItemList.length - 1) {
                        controller.animateToPage(selectedIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      } else {
                        Navigator.popAndPushNamed(context, AppRoutes.logreg);
                      }
                    },
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: const BoxDecoration(
                        color: themeDark,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/arrow-right.svg",
                          width: 30.w,
                          color: pureWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
