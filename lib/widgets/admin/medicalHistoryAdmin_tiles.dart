import 'package:e_klinik_pens/models/medical_records.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalHistoryAdminTiles extends StatefulWidget {
  const MedicalHistoryAdminTiles({super.key});

  @override 
  State<MedicalHistoryAdminTiles> createState() => _MedicalHistoryAdminTilesState();
}

class _MedicalHistoryAdminTilesState extends State<MedicalHistoryAdminTiles> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index){
                final medicalRecord= medicalRecordsUser[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 16, bottom: 8).r,
                  child: Card(
                    elevation: 2,
                    surfaceTintColor: Colors.transparent,
                    color: pureWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ExpansionTile(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                      ),
                      leading: AnimatedContainer(
                        height: medicalRecord.isExpanded ? 150.w : 75.w,
                        width: medicalRecord.isExpanded ? 150.w : 75.w,
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0).r,
                        ),
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 300),
                          scale: medicalRecord.isExpanded ? 1.05 : 1.0,
                          child: Image.asset(
                            medicalRecord.profilePhoto.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(medicalRecord.patient.toString(),
                      style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(medicalRecord.nrp.toString(), 
                          style: TextStyle(
                            color: navbar,
                            fontSize: 14.sp
                          ),
                          ), 
                        ],
                      ),
                      children: <Widget>[
                        ListTile(
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [     
                              Row(
                                children: [
                                  Text(
                                    'Tanggal Periksa: ',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    medicalRecord.checkDate.toString(),
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
                                      'Dokter: ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      medicalRecord.doctor,
                                      style: TextStyle(
                                        fontSize: 14.sp
                                    ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Gejala: ',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                medicalRecord.symptoms,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0).r,
                                child: Text(
                                  'Diagnosa:',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                medicalRecord.diagnose,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: danger,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0).r,
                                child: Text(
                                  'Obat:',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                medicalRecord.medicine,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0).r,
                                child: Text(
                                  'Kritik & Saran:',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                medicalRecord.advice,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                      onExpansionChanged: (isExpanded){
                        setState(() {
                          medicalRecord.isExpanded= isExpanded;
                        });
                      },
                    ),
                  ),
                );
              },
              childCount: medicalRecordsUser.length
            ),
          );
        }
}