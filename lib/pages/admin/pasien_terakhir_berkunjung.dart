import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/admin/medicalHistoryAdmin_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasienTerakhirBerkunjung extends StatefulWidget {
  const PasienTerakhirBerkunjung({super.key});

  @override
  State<PasienTerakhirBerkunjung> createState() =>
      _PasienTerakhirBerkunjungState();
}

class _PasienTerakhirBerkunjungState extends State<PasienTerakhirBerkunjung> {
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
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: pureWhite,),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0).w,
              child: Text(
                "Pasien Terakhir Berkunjung",
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: MediaQuery.of(context).size.width * 0.050, 
                  color: pureWhite,
                ),
              ),
            ),
            centerTitle: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.140,
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
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          const MedicalHistoryAdminTiles()
        ],
      ),
    );
  }
}