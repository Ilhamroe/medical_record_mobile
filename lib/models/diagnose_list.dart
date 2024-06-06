import 'package:flutter/material.dart';
import 'package:e_klinik_pens/models/doctor_list.dart';
import 'package:e_klinik_pens/widgets/home_page/diagnose_card_detail.dart';

class GejalaDiagnosaList extends StatelessWidget {
  final List<GejalaDiagnosa> gejalaDiagnosas;

  const GejalaDiagnosaList({required this.gejalaDiagnosas, super.key});

  @override
  Widget build(BuildContext context) {
    return GejalaDiagnosaListView(gejalaDiagnosas: gejalaDiagnosas);
  }
}

class GejalaDiagnosa {
  final DateTime tglPeriksa;
  final Doctor doctor;
  final List<String> gejala;
  final String diagnosa;

  GejalaDiagnosa({
    required this.tglPeriksa,
    required this.doctor,
    required this.gejala,
    required this.diagnosa,
  });
}

Doctor doctor = doctors[0];

GejalaDiagnosa diagnosa = GejalaDiagnosa(
  tglPeriksa: DateTime.now(),
  doctor: doctor,
  gejala: ['Fever', 'Cough', 'Headache'],
  diagnosa: "sakit titit",
);

List<GejalaDiagnosa> gejalaDiagnosaList = [diagnosa];
