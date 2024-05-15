import 'package:e_klinik_pens/models/faq_lists.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/profiles/faq_tiles.dart';
import 'package:e_klinik_pens/widgets/profiles/profile.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<FaqLists> faqLists= FaqContents.faqLists;
  late List<bool> isExpandedList;

  @override
  void initState() {
    super.initState();
    isExpandedList= List.generate(
      faqLists.length, (index) => false
      );
  }

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
            title: Text("FAQ", style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: MediaQuery.of(context).size.width * 0.055, 
              color: pureWhite
            ),
          ),
            centerTitle: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.115,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/atom.png",
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
            delegate: SliverChildListDelegate([
              FaqTiles(
                title: "Apa itu E-Klinik PENS?", 
                desc: "E-Klinik PENS adalah platform digital yang disediakan oleh Politeknik Elektronika Negeri Surabaya (PENS) yang mana memungkinkan akses layanan kesehatan secara online. Melalui E-Klinik PENS, para pasien dapat dengan mudah mengakses rekam medis dan jadwal dokter tanpa harus datang langsung ke klinik  secara fisik."
              ),
              customDivider(context),
              FaqTiles(
                title: "Apa saja fitur-fitur yang ditawarkan oleh E-Klinik PENS?", 
                desc: "1. Informasi Dokter : Memungkinakn pasien untuk mengetahui deskripsi singkat tentang dokter tersebut\n2. Jadwal Dokter : Berisi informasi untuk memudahkan pasien mengetahui dokter yang jaga di hari tersebut tanpa datang ke klinik dulu\n3. Riwayat Rekam Medis: Memungkinkan pasien untuk mengakses dan mendownload riwayat medis mereka secara online, didalamnya berisi tanggal kunjungan, gejala dan diagnosis, serta saran dan masukan\n4. Gejala dan Diagnosis : Gejala dan diagnosis dari dokter yang tercatat setelah pasien mengunjugi klinik\n5. Saran dan Masukan: Saran dan masukan dari dokter yang tercatat setelah pasien mengunjugi klinik."
              ),
              customDivider(context),
              FaqTiles(
                title: "Siapa saja yang dapat menggunakan aplikasi ini?", 
                desc: "Secara umum, E-Klinik PENS dapat digunakan oleh berbagai pihak baik dokter dan yang membutuhkan layanan kesehatan, termasuk para mahasiswa dan para staff kampus."
              ),
              customDivider(context),
              FaqTiles(
                title: "Bagaimana E-Klinik PENS dapat membantu meningkatkan efisiensi pelayanan kesehatan?", 
                desc: "1. Aksesibilitas: Memungkinkan pasien untuk mengakse secara online tanpa harus datang langsung ke klinik.\n2. Pengelolaan Riwayat Rekam Medis: Memudahkan pengelolaan riwayat rekam medis pasien secara digital, sehingga informasi medis dapat diakses dengan mudah oleh dokter dan pasien sendiri.\n3. Monitoring Data Pasien: Memungkinkan dokter untuk mengetahui data pasien dengan mudah dan mengidentifikasi gejala yang dialami pada tiap pasien yang berkunjung."
              ),
              customDivider(context),
              
            ]
              // faqLists.asMap().entries.map((entry) {
              //   final index= entry.key;
              //   final faqList= entry.value;
              //   return Column(
              //     children:[
              //       FaqTiles(
              //         faqLists: faqList, 
              //         isExpanded: isExpandedList[index],
              //       ),
              //       customDivider(context),
              //     ],
              //   ); 
              // }).toList(),
            )
          ),
        ],
      ),
    );
  }
}