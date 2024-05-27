import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/record.png"),
                    Text(
                        "Tidak ada riwayat\nrekam medis", style: TextStyle(
                          color: silverChalice,
                          fontSize: MediaQuery.of(context).size.width * 0.045
                        ),
                    )
                    ],
                  ),
                ),
              ]      
            )
          ),
        ],
      ),
    );
  }
}