import 'package:flutter/material.dart';
import 'package:e_klinik_pens/models/doctor_list.dart';

  class DoctorCard extends StatelessWidget {
      final Doctor doctor;
    const DoctorCard({required this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 120, 
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(doctor.icon.toString()),
              radius: 30,
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                doctor.role,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DoctorListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(doctor: doctors[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
      ),
    );
  }
}