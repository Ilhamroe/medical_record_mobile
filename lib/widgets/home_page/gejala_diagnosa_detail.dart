import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/home_page/gejala_diagnosa_card_detail.dart';
import 'package:e_klinik_pens/models/gejala_diagnosa_list.dart';

class GejalaDiagnosaDetail extends StatelessWidget {
  const GejalaDiagnosaDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Gejala & Diagnosa',
          style: TextStyle(
            color: pureWhite,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: pureWhite,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Transform.translate(
                  offset: const Offset(200, -100),
                  child: Image.asset("assets/images/atomic.png")),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF6F8FF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: GejalaDiagnosaListView(gejalaDiagnosas: gejalaDiagnosaList),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
