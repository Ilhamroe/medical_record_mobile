import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/models/gejala_diagnosa_list.dart';
import 'package:intl/intl.dart';


class GejalaDiagnosaCardDetail extends StatelessWidget {
  final GejalaDiagnosa gejalaDiagnosa;

  const GejalaDiagnosaCardDetail({Key? key, required this.gejalaDiagnosa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: aquaHaze,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal Periksa:',
                        style: TextStyle(
                          color: pureWhite, 
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        formatTanggal(gejalaDiagnosa.tglPeriksa),
                        style: TextStyle(
                          color: pureWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dokter: ',
                        style: TextStyle(
                          color: pureWhite, 
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        gejalaDiagnosa.doctor.name,
                        style: TextStyle(
                          color: pureWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey, 
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gejala:',
                    style: TextStyle(
                      color: blackText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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
                              fontSize: 12,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              gejala,
                              style: TextStyle(
                                color: blackText,
                                fontSize: 12,
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
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      gejalaDiagnosa.diagnosa,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GejalaDiagnosaListView extends StatelessWidget {
  final List<GejalaDiagnosa> gejalaDiagnosas;

  const GejalaDiagnosaListView({required this.gejalaDiagnosas, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: double.infinity),
      child: ListView.separated(
        padding: EdgeInsets.all(8.0),
        shrinkWrap: true,
        itemCount: gejalaDiagnosas.length,
        itemBuilder: (context, index) {
          return GejalaDiagnosaCardDetail(gejalaDiagnosa: gejalaDiagnosas[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
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
