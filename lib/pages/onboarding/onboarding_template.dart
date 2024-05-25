import 'package:e_klinik_pens/models/onboarding_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentTemplate extends StatelessWidget {
  const ContentTemplate({
    super.key,
    required this.item,
  });

  final OnBoardItems item;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          item.image,
          height: size.height * 0.3.h,
        ),
        // FittedBox(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 30).r,
        //     child: Text(
        //       item.title,
        //       style: Theme.of(context)
        //           .textTheme
        //           .headlineLarge!
        //           .copyWith(fontFamily: 'Inter-Bold'),
        //     ),
        //   ),
        // ),
        SizedBox(height: size.height * 0.01.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30).r,
          child: Text(
            item.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter-Bold'
                ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: size.height * 0.1.h),
      ],
    );
  }
}
