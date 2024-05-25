import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/models/schedule_doctor_list.dart';

class ScheduleDoctorDetail extends StatelessWidget {
  final ScheduleDoctor scheduleDoctor;
  const ScheduleDoctorDetail({required this.scheduleDoctor, super.key});

  // Function to determine text based on time of day
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
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      formatTime(scheduleDoctor.startTime), 
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: 2.0,
                      height: 27.0,
                      color: determineLineColor(scheduleDoctor.startTime), // Determine line color
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatTime(scheduleDoctor.endTime), // Display formatted end time
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        scheduleDoctor.doctor.name,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 42.0),
                      Text(
                        scheduleDoctor.doctor.role,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 8.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  determineTimeOfDay(scheduleDoctor.startTime),
                  style: TextStyle(
                    fontSize: 13,
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
      constraints: BoxConstraints(maxWidth: double.infinity),
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        shrinkWrap: true,
        itemCount: scheduleDoctor.length,
        itemBuilder: (context, index) {
          return ScheduleDoctorDetail(scheduleDoctor: scheduleDoctor[index]);
        },
      ),
    );
  }
}
