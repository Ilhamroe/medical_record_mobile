import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/models/schedule_doctor_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleDoctorDetail extends StatelessWidget {
  final ScheduleDoctor scheduleDoctor;
  const ScheduleDoctorDetail({required this.scheduleDoctor, super.key});

  String determineTimeOfDay(TimeOfDay startTime) {
    if (startTime.period == DayPeriod.am) {
      return 'Pagi';
    } else {
      return 'Sore';
    }
  }

  String formatTime(TimeOfDay time) {
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod; 
    return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
  }

  Color determineLineColor(TimeOfDay startTime) {
    return determineTimeOfDay(startTime) == 'Pagi' ? danger : sore;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      color: pureWhite,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0).w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0).r,
                        child: Text(
                          formatTime(scheduleDoctor.startTime),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0).w,
                        child: Container(
                          width: 2.0,
                          height: 27.0,
                          color: determineLineColor(scheduleDoctor.startTime), 
                        ),
                      ),
                      Text(
                        formatTime(scheduleDoctor.endTime), 
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0.w),
                  Flexible( 
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scheduleDoctor.doctor.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 31.0.h), 
                        Text(
                          scheduleDoctor.doctor.role,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0, 
              top: 7.0.w, 
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0).w,
                child: Text(
                  determineTimeOfDay(scheduleDoctor.startTime),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: determineTimeOfDay(scheduleDoctor.startTime) == 'Sore'
                        ? themeDark
                        : themeDark,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class ScheduleDoctorListView extends StatelessWidget {
  final List<ScheduleDoctor> scheduleDoctor;

  const ScheduleDoctorListView({required this.scheduleDoctor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: double.infinity),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: scheduleDoctor.length,
        itemBuilder: (context, index) {
          return ScheduleDoctorDetail(scheduleDoctor: scheduleDoctor[index]);
        },
      ),
    );
  }
}
