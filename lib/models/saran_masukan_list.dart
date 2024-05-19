import 'package:e_klinik_pens/widgets/home_page/saran_masukan_card_detail.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/models/doctor_list.dart';


class SaranMasukanList extends StatelessWidget {
final List<SaranMasukan> saranMasukans;

  const SaranMasukanList({required this.saranMasukans, super.key});

  @override
  Widget build(BuildContext context) {
    return SaranMasukanListView();
  }
}

class SaranMasukan {
  final DateTime tglPeriksa;
  final Doctor doctor;
  final List<String> saranmasukan;

  SaranMasukan({
    required this.tglPeriksa,
    required this.doctor,
    required this.saranmasukan
  });
}

Doctor doctor = doctors[0];

SaranMasukan saran = SaranMasukan(
  tglPeriksa: DateTime.now(), 
  doctor: doctor, 
  saranmasukan: ['Jangan minum banyak ES','Banyak Istirahat','Minum obat 3x sehari'],
  );

List<SaranMasukan> saranMasukanList  = [saran];