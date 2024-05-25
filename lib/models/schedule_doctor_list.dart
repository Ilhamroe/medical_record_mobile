import 'package:e_klinik_pens/models/doctor_list.dart';
import 'package:e_klinik_pens/widgets/common/schedule_doctor_detail.dart';
import 'package:flutter/material.dart';

class ScheduleDoctorList extends StatelessWidget {
  final List<ScheduleDoctor> scheduleDoctor;

  const ScheduleDoctorList({required this.scheduleDoctor, super.key});

  @override
  Widget build(BuildContext context) {
    return ScheduleDoctorListView(scheduleDoctor: scheduleDoctor);
  }
}

class ScheduleDoctor {
  final Doctor doctor;
  final String day;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  ScheduleDoctor({
    required this.doctor,
    required this.day,
    required this.startTime,
    required this.endTime,
  });
}

Doctor doctor1 = doctors[0];
Doctor doctor2 = doctors[1];
Doctor doctor3 = doctors[2];

ScheduleDoctor scheduleDoctor1 = ScheduleDoctor(
  doctor: doctor1,
  day: "Selasa",
  startTime: TimeOfDay(hour: 10, minute: 0),
  endTime: TimeOfDay(hour: 12, minute: 0),
);

ScheduleDoctor scheduleDoctor2 = ScheduleDoctor(
  doctor: doctor2,
  day: "Rabu",
  startTime: TimeOfDay(hour: 9, minute: 0),
  endTime: TimeOfDay(hour: 11, minute: 0),
);

ScheduleDoctor scheduleDoctor3 = ScheduleDoctor(
  doctor: doctor3,
  day: "Kamis",
  startTime: TimeOfDay(hour: 13, minute: 0),
  endTime: TimeOfDay(hour: 15, minute: 0),
);

List<ScheduleDoctor> scheduleDoctors = [
  scheduleDoctor1,
  scheduleDoctor2,
  scheduleDoctor3,
];
