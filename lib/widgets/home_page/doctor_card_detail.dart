import 'package:flutter/material.dart';
import 'package:e_klinik_pens/models/doctor_list.dart';
import 'package:e_klinik_pens/utils/color.dart';

class DoctorCardDetail extends StatelessWidget {
  final Doctor doctor;
  const DoctorCardDetail({required this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: aquaHaze,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: doctor.icon,
                    height: 111,
                    width: 111,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: TextStyle(
                          color: blackText,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        doctor.role,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), 
            Text(
              'Deskripsi:',
              style: TextStyle(
                color: blackText,
                fontSize: 16,
              ),
            ),
            Text(
              doctor.desc,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorDetailListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: double.infinity),
      child: ListView.separated(
        padding: EdgeInsets.all(8.0),
        shrinkWrap: true,
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorCardDetail(doctor: doctors[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
      ),
    );
  }
}
