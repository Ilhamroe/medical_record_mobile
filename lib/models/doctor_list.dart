import 'package:flutter/material.dart';
import 'package:e_klinik_pens/widgets/home_page/doctor_card.dart';

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorList({required this.doctors, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return DoctorCard(doctor: doctor);
      },
    );
  }
}


class Doctor {
  String? icon;
  final String name;
  final String role;
  String? desc;

  Doctor({
    this.icon,
    required this.name,
    required this.role,
    this.desc,
  });
}

final List<Doctor> doctors = [
  Doctor(
    icon: 'assets/images/avatar_doctor_1.png', 
    name: 'Dr. John Doe',
    role: 'General Physician',
    desc: 'Dokter umum yang berpengalaman dengan lebih dari 4 tahun pengalaman dalam memberikan perawatan dan diagnosis pasien yang komprehensif.'
  ),
  Doctor(
    icon: 'assets/images/avatar_doctor_2.png', 
    name: 'Dr. Jane Smith',
    role: 'Pediatrician',
    desc: 'Dokter umum yang terampil dalam evaluasi pasien, diagnosis, dan perawatan untuk membantu pasien mengendalikan gejala.'
  ),
  Doctor(
    icon: 'assets/images/avatar_doctor_3.png', 
    name: 'Dr. Alex Johnson',
    role: 'Surgeon',
    desc: 'Berpengalaman sebagai dokter umum selama 5 tahun. Siap melayani situasi medis dalam keadaan darurat atau non-darurat.'
  ),
];
