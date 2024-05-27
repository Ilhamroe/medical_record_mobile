import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqTiles{
  final Widget title;
  final Widget desc;

  const FaqTiles({
    required this.title,
    required this.desc,
  });
}

final List<FaqTiles> faqTiles=[
  FaqTiles(
    title: Text(
      "Apa itu E-Klinik PENS?",
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400
      ),  
    ),
    desc:const Text(
      "E-Klinik PENS adalah platform digital yang disediakan oleh Politeknik Elektronika Negeri Surabaya (PENS) yang mana memungkinkan akses layanan kesehatan secara online. Melalui E-Klinik PENS, para pasien dapat dengan mudah mengakses rekam medis dan jadwal dokter tanpa harus datang langsung ke klinik  secara fisik.",
      style: TextStyle(
        color: textColor,
        height: 2,
      ),    
    ),
  ),
  FaqTiles(
    title: Text(
      "Apa saja fitur-fitur yang ditawarkan oleh E-Klinik PENS?",
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400
      ),  
    ),
    desc:const Text(
      "1. Informasi Dokter : Memungkinakn pasien untuk mengetahui deskripsi singkat tentang dokter tersebut.\n\n2. Jadwal Dokter : Berisi informasi untuk memudahkan pasien mengetahui dokter yang jaga di hari tersebut tanpa datang ke klinik dulu.\n\n3. Riwayat Rekam Medis: Memungkinkan pasien untuk mengakses dan mendownload riwayat medis mereka secara online, didalamnya berisi tanggal kunjungan, gejala dan diagnosis, serta saran dan masukan.\n\n4. Gejala dan Diagnosis : Gejala dan diagnosis dari dokter yang tercatat setelah pasien mengunjugi klinik.\n\n5. Saran dan Masukan: Saran dan masukan dari dokter yang tercatat setelah pasien mengunjugi klinik.",
      style: TextStyle(
        color: textColor,
        height: 2,
      ),    
    ),
  ),
  FaqTiles(
    title: Text(
      "Siapa saja yang dapat menggunakan aplikasi ini?", 
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400
      ),  
    ),
    desc:const Text(
     "Secara umum, E-Klinik PENS dapat digunakan oleh berbagai pihak baik dokter dan yang membutuhkan layanan kesehatan, termasuk para mahasiswa dan para staff kampus.",
      style: TextStyle(
        color: textColor,
        height: 2,
      ),    
    ),
  ),
  FaqTiles(
    title: Text(
      "Bagaimana E-Klinik PENS dapat membantu meningkatkan efisiensi pelayanan kesehatan?", 
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400
      ),  
    ),
    desc: const Text(
      "1. Aksesibilitas: Memungkinkan pasien untuk mengakse secara online tanpa harus datang langsung ke klinik.\n\n2. Pengelolaan Riwayat Rekam Medis: Memudahkan pengelolaan riwayat rekam medis pasien secara digital, sehingga informasi medis dapat diakses dengan mudah oleh dokter dan pasien sendiri.\n\n3. Monitoring Data Pasien: Memungkinkan dokter untuk mengetahui data pasien dengan mudah dan mengidentifikasi gejala yang dialami pada tiap pasien yang berkunjung.",
      style: TextStyle(
        color: textColor,
        height: 2,
      ),    
    ),
  ),

];