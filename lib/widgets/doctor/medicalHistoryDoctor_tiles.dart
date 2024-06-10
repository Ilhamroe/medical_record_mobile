import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_klinik_pens/authentication/service_clinic.dart';
import 'package:e_klinik_pens/models/clinics.dart';

class MedicalHistoryDoctorTiles extends StatefulWidget {
  const MedicalHistoryDoctorTiles({super.key});

  @override
  State<MedicalHistoryDoctorTiles> createState() => _MedicalHistoryDoctorTilesState();
}

class _MedicalHistoryDoctorTilesState extends State<MedicalHistoryDoctorTiles> {
  final ServiceClinic serviceAPI = ServiceClinic();
  late Future<List<Clinic>> listData;

  @override
  void initState() {
    super.initState();
    listData = serviceAPI.fetchDoctorClinicData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Clinic>>(
      future: listData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/record.png"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tidak ada riwayat",
                        style: TextStyle(
                          color: silverChalice,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "rekam medis",
                        style: TextStyle(
                          color: silverChalice,
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          List<Clinic> valueData = snapshot.data!;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Clinic clinic = valueData[index];
                return Padding(
                  padding: const EdgeInsets.only(
                          top: 5.0, left: 15, right: 15, bottom: 10)
                      .r,
                  child: Column(
                    children: [
                      Card(
                        surfaceTintColor: Colors.transparent,
                        color: pureWhite,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                                  top: 10.0, left: 10, right: 10, bottom: 5)
                              .r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                            vertical: 12.5)
                                        .w,
                                    child: Text(
                                      "SURAT REKAM MEDIS",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: themeDark,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Tanggal Periksa: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Text(
                                    clinic.dated,
                                    style: TextStyle(fontSize: 14.sp),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0).w,
                                child: Row(
                                  children: [
                                    Text(
                                      "Pasien: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      clinic.patient,
                                      style: TextStyle(fontSize: 14.sp),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0).w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Gejala: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Text(
                                            clinic.symptom,
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Diagnosa:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                clinic.diagnosis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: danger,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0).w,
                                child: Row(
                                  children: [
                                    Text(
                                      "Obat: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      clinic.drug,
                                      style: TextStyle(fontSize: 14.sp),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Kritik dan Saran: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Text(
                                          clinic.advice,
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: valueData.length,
            ),
          );
        }
      },
    );
  }
}
