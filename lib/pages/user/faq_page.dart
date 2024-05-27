import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/models/faq_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: themeLight,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded, color: pureWhite,
                )
              ),
            title: Text("FAQ", style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20.sp, 
              color: pureWhite
            ),
          ),
            centerTitle: true,
            expandedHeight: 75.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/atom.png",
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0), 
              child: Container(
                height: 20.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: pureWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(32).w,
                    topRight: const Radius.circular(32).w
                  )
                ),
              )
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final faqTile= faqTiles[index];
                return Column(
                  children: [
                    ExpansionTile(
                      tilePadding: const EdgeInsets.only(left: 35, top: 7.5, bottom: 7.5, right: 25).r,
                      childrenPadding: const EdgeInsets.only(left: 25).r,
                      title: faqTile.title,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide.none
                      ),
                      collapsedIconColor: themeDark,
                      iconColor: themeDark,      
                      children: [
                        ListTile(
                          title: faqTile.desc,
                        )
                      ],
                    ),
                    const Divider(
                      color: divider,
                    )
                  ],
                );
              },
              childCount: faqTiles.length,
            ),
          ),
        ],
      ),
    );
  }
}