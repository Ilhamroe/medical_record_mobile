import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/common/medicalHistoryUser_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  final int contoh = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: themeLight,
            title: Text(
              "Riwayat Rekam Medis",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.055,
                color: pureWhite,
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
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
            ),
          ),
          contoh == 1
              ? const MedicalHistoryUser()
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
                                fontSize: 18.sp,
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
                                fontSize: 18.sp,
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