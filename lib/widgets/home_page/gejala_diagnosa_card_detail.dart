import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/models/gejala_diagnosa_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GejalaDiagnosaCardDetail extends StatelessWidget {
  final GejalaDiagnosa gejalaDiagnosa;

  const GejalaDiagnosaCardDetail({super.key, required this.gejalaDiagnosa});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      surfaceTintColor: Colors.transparent,
      color: pureWhite,  
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20).w,
      ),
      margin: const EdgeInsets.only(top: 20.0, left: 15, right: 15).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeDark,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20).w,
                topRight: const Radius.circular(20).w,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal Periksa: ',
                        style: TextStyle(
                          color: pureWhite, 
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        formatTanggal(gejalaDiagnosa.tglPeriksa),
                        style: TextStyle(
                          color: pureWhite,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dokter: ',
                        style: TextStyle(
                          color: pureWhite, 
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        gejalaDiagnosa.doctor.name,
                        style: TextStyle(
                          color: pureWhite,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gejala:',
                  style: TextStyle(
                    color: blackText,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                for (var gejala in gejalaDiagnosa.gejala)
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u2022 ',
                          style: TextStyle(
                            color: blackText,
                            fontSize: 12.sp,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            gejala,
                            style: TextStyle(
                              color: blackText,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Diagnosa:',
                    style: TextStyle(
                      color: blackText,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    gejalaDiagnosa.diagnosa,
                    style: TextStyle(
                      color: danger,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GejalaDiagnosaListView extends StatelessWidget {
  final List<GejalaDiagnosa> gejalaDiagnosas;

  const GejalaDiagnosaListView({required this.gejalaDiagnosas, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: double.infinity),
      child: ListView.separated(
        padding: const EdgeInsets.all(8.0).r,
        shrinkWrap: true,
        itemCount: gejalaDiagnosas.length,
        itemBuilder: (context, index) {
          return GejalaDiagnosaCardDetail(gejalaDiagnosa: gejalaDiagnosas[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10.h);
        },
      ),
    );
  }
}

String formatTanggal(DateTime date) {
  List<String> bulan = [
    '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
  ];

  return '${date.day} ${bulan[date.month]} ${date.year}';
}
