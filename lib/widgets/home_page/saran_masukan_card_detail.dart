import 'package:e_klinik_pens/authentication/service_clinic.dart';
import 'package:e_klinik_pens/models/clinics.dart';
import 'package:e_klinik_pens/models/saran_masukan_list.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SaranMasukanCardDetail extends StatefulWidget {

  const SaranMasukanCardDetail({super.key,});

  @override
  State<SaranMasukanCardDetail> createState() => _SaranMasukanCardDetailState();
}

class _SaranMasukanCardDetailState extends State<SaranMasukanCardDetail> {
  final ServiceClinic serviceAPI = ServiceClinic();
  late Future<List<Clinic>> listData;

  @override
  void initState() {
    super.initState();
    listData = serviceAPI.fetchUserClinicData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Clinic>>(
      future: listData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          final clinics = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: clinics.map((clinic) {
                return Card(
                  elevation: 4,
                  surfaceTintColor: Colors.transparent,
                  color: pureWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: themeDark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tanggal Periksa: ',
                                    style: TextStyle(
                                      color: pureWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    formatTanggal(clinic.dated),
                                    style: const TextStyle(
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
                                  const Text(
                                    'Dokter: ',
                                    style: TextStyle(
                                      color: pureWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    clinic.doctor,
                                    style: const TextStyle(
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
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Kritik dan Saran:',
                                style: TextStyle(
                                  color: blackText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                clinic.advice,
                                style: const TextStyle(
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
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}

class SaranMasukanListView extends StatelessWidget {
  const SaranMasukanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: double.infinity),
        child: SaranMasukanCardDetail());
  }
}

String formatTanggal(String dateStr) {
  DateTime date = DateFormat('yyyy-MM-dd').parse(dateStr);
  List<String> bulan = [
    '',
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  return '${date.day} ${bulan[date.month]} ${date.year}';
}
