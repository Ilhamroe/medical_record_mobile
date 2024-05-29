import 'package:e_klinik_pens/models/faq_list.dart';
import 'package:e_klinik_pens/models/schedule_doctor_list.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  final int contoh=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: themeLight,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: pureWhite,)
              ),
            title: Text("Riwayat Rekam Medis", style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: MediaQuery.of(context).size.width * 0.055, 
              color: pureWhite
            ),
          ),
            centerTitle: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.115,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/atomic.png",
                fit: BoxFit.cover,
              ),
            ),
             bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0), 
              child: Container(
                height: MediaQuery.of(context).size.height * 0.0275,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: pureWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)
                  )
                ),
              )
            ),
          ),
          contoh == 1 
            ? SliverList(
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
            )
          : SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/record.png"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tidak ada riwayat",
                        style: TextStyle(
                          color: silverChalice,
                          fontSize: 18.sp
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "rekam medis",
                        style: TextStyle(
                          color: silverChalice,
                          fontSize: 18.sp
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}