import 'package:e_klinik_pens/models/saran_masukan_list.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';

class SaranMasukanCardDetail extends StatelessWidget {
  final SaranMasukan saranMasukans;

  const SaranMasukanCardDetail({ required this.saranMasukans, super.key});

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
                        formatTanggal(saranMasukans.tglPeriksa),
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
                        saranMasukans.doctor.name,
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
                    'Kritik & Saran:',
                    style: TextStyle(
                      color: blackText,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  for (var gejala in saranMasukans.saranmasukan)
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class SaranMasukanListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: double.infinity),
      child: ListView.separated(
        padding: EdgeInsets.all(8.0),
        shrinkWrap: true,
        itemCount: saranMasukanList.length,
        itemBuilder: (context, index) {
          return SaranMasukanCardDetail(saranMasukans: saranMasukanList[index]);
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
