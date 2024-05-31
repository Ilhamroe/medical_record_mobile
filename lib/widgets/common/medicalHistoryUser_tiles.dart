import 'package:e_klinik_pens/models/medical_records.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalHistoryUser extends StatefulWidget {
  const MedicalHistoryUser({super.key});

  @override
  State<MedicalHistoryUser> createState() => _MedicalHistoryTilesState();
}

class _MedicalHistoryTilesState extends State<MedicalHistoryUser> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final medicalrecordsuser= medicalRecordsUser[index];
          return Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 15, right: 15, bottom: 10).r,
            child: Column(
              children: [
                Card(
                  surfaceTintColor: Colors.transparent,
                  color: pureWhite,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 5).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.5).w,
                              child: Text(
                                "SURAT REKAM MEDIS",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: themeDark
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
                              medicalrecordsuser.checkDate,
                              style: TextStyle(
                                fontSize: 14.sp
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0).w,
                          child: Row(
                            children: [
                              Text(
                                "Dokter: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                              ),
                              Text(
                                medicalrecordsuser.doctor,
                                style: TextStyle(
                                  fontSize: 14.sp
                              ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Pasien: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                            ),
                            Text(
                              medicalrecordsuser.patient.toString(),
                              style: TextStyle(
                                fontSize: 14.sp
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0).w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Gejala: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp
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
                                      medicalrecordsuser.symptoms,
                                      style: TextStyle(
                                        fontSize: 14.sp
                                      ),
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
                          medicalrecordsuser.diagnose,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: danger,
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0).w,
                          child: Row(
                            children: [
                              Text(
                                "Obat: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp
                                ),
                              ),
                              Text(
                                medicalrecordsuser.medicine,
                                style: TextStyle(
                                  fontSize: 14.sp
                              ),
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
                                    fontSize: 14.sp
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
                                    medicalrecordsuser.advice,
                                    style: TextStyle(
                                      fontSize: 14.sp
                                    ),
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
        childCount: medicalRecordsUser.length
      ),
    );
  }
}