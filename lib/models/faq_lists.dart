class FaqLists{
  String title;
  String description;

  FaqLists({
    required this.title,
    required this.description
  });
}

class FaqContents{
  static List <FaqLists> faqLists=[
    FaqLists(
    title: "Apa itu E-Klinik PENS?", 
    description: "E-Klinik PENS adalah platform digital yang disediakan oleh Politeknik Elektronika Negeri Surabaya (PENS) yang mana memungkinkan akses layanan kesehatan secara online. Melalui E-Klinik PENS, para pasien dapat dengan mudah mengakses rekam medis dan jadwal dokter tanpa harus datang langsung ke klinik  secara fisik."
  ),
    FaqLists(
      title: "Apa saja fitur-fitur yang ditawarkan oleh E-Klinik PENS?", 
      description: "1. Informasi Dokter : Memungkinakn pasien untuk mengetahui deskripsi singkat tentang dokter tersebut\n2. Jadwal Dokter : Berisi informasi untuk memudahkan pasien mengetahui dokter yang jaga di hari tersebut tanpa datang ke klinik dulu\n3. Riwayat Rekam Medis: Memungkinkan pasien untuk mengakses dan mendownload riwayat medis mereka secara online, didalamnya berisi tanggal kunjungan, gejala dan diagnosis, serta saran dan masukan\n4. Gejala dan Diagnosis : Gejala dan diagnosis dari dokter yang tercatat setelah pasien mengunjugi klinik\n5. Saran dan Masukan: Saran dan masukan dari dokter yang tercatat setelah pasien mengunjugi klinik."
    ),
    FaqLists(
      title: "Siapa saja yang dapat menggunakan aplikasi ini?", 
      description: "Secara umum, E-Klinik PENS dapat digunakan oleh berbagai pihak baik dokter dan yang membutuhkan layanan kesehatan, termasuk para mahasiswa dan para staff kampus."
    ),
    FaqLists(
      title: "Bagaimana E-Klinik PENS dapat membantu meningkatkan efisiensi pelayanan kesehatan?", 
      description: "1. Aksesibilitas: Memungkinkan pasien untuk mengakse secara online tanpa harus datang langsung ke klinik.\n2. Pengelolaan Riwayat Rekam Medis: Memudahkan pengelolaan riwayat rekam medis pasien secara digital, sehingga informasi medis dapat diakses dengan mudah oleh dokter dan pasien sendiri.\n3. Monitoring Data Pasien: Memungkinkan dokter untuk mengetahui data pasien dengan mudah dan mengidentifikasi gejala yang dialami pada tiap pasien yang berkunjung."
    ),
  ];
}