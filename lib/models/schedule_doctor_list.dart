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
  day: "Senin",
  startTime: const TimeOfDay(hour: 10, minute: 0),
  endTime: const TimeOfDay(hour: 12, minute: 0),
);

ScheduleDoctor scheduleDoctor2 = ScheduleDoctor(
  doctor: doctor2,
  day: "Senin",
  startTime: const TimeOfDay(hour: 13, minute: 0),
  endTime: const TimeOfDay(hour: 15, minute: 0),
);

ScheduleDoctor scheduleDoctor3 = ScheduleDoctor(
  doctor: doctor1,
  day: "Selasa",
  startTime: const TimeOfDay(hour: 13, minute: 0),
  endTime: const TimeOfDay(hour: 15, minute: 0),
);

ScheduleDoctor scheduleDoctor4 = ScheduleDoctor(
  doctor: doctor2,
  day: "Rabu",
  startTime: const TimeOfDay(hour: 10, minute: 0),
  endTime: const TimeOfDay(hour: 12, minute: 0),
);

ScheduleDoctor scheduleDoctor5 = ScheduleDoctor(
  doctor: doctor1,
  day: "Rabu",
  startTime: const TimeOfDay(hour: 13, minute: 0),
  endTime: const TimeOfDay(hour: 15, minute: 0),
);

ScheduleDoctor scheduleDoctor6 = ScheduleDoctor(
  doctor: doctor2,
  day: "Kamis",
  startTime: const TimeOfDay(hour: 13, minute: 0),
  endTime: const TimeOfDay(hour: 15, minute: 0),
);

ScheduleDoctor scheduleDoctor7 = ScheduleDoctor(
  doctor: doctor3,
  day: "Jumat",
  startTime: const TimeOfDay(hour: 13, minute: 0),
  endTime: const TimeOfDay(hour: 15, minute: 0),
);

List<ScheduleDoctor> scheduleDoctors = [
  scheduleDoctor1,
  scheduleDoctor2,
  scheduleDoctor3,
  scheduleDoctor4,
  scheduleDoctor5,
  scheduleDoctor6,
  scheduleDoctor7,
];
