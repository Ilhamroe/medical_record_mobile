import 'package:e_klinik_pens/models/schedule_doctor_list.dart';
import 'package:e_klinik_pens/widgets/common/day_card.dart';
import 'package:e_klinik_pens/widgets/common/schedule_doctor_detail.dart';
import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleDoctorScreen extends StatefulWidget {
  final List<ScheduleDoctor> scheduleDoctors;

  const ScheduleDoctorScreen({required this.scheduleDoctors, super.key});

  @override
  _ScheduleDoctorScreenState createState() => _ScheduleDoctorScreenState();
}

class _ScheduleDoctorScreenState extends State<ScheduleDoctorScreen> {
  String? selectedDay;

  @override
  void initState() {
    super.initState();
    DateTime now= DateTime.now();
    selectedDay= _formatDay(now);
  }

  void _onDaySelected(String day) {
    setState(() {
      selectedDay = day;
    });
  }

  String _formatDay(DateTime date) {
  List<String> days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
  return days[date.weekday % 7];
  }

  String formatTanggal(DateTime date) {
    List<String> hari = [
      'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'
    ];
    List<String> bulan = [
      '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return '${hari[date.weekday % 7]}, ${date.day} ${bulan[date.month]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    List<ScheduleDoctor> filteredSchedule = widget.scheduleDoctors; 
    if (selectedDay != null) {
      filteredSchedule = widget.scheduleDoctors.where((schedule) => schedule.day == selectedDay).toList();
    }

    DateTime now = DateTime.now();
    String formattedDate =  formatTanggal(now);
    print('Current date and time: $now');

    return Scaffold(
      backgroundColor: themeLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Jadwal Dokter',
          style: TextStyle(
            color: pureWhite,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: pureWhite,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Transform.translate(
                offset: const Offset(200, -100),
                child: Image.asset("assets/images/atomic.png"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.center, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  children: [
                    Text(
                      formattedDate,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: pureWhite,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: today,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Text(
                            'Hari Ini',
                            style: TextStyle(
                              color: blackText,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 24.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F8FF),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(35).r,
                            topRight: const Radius.circular(35).r,
                          ),
                        ),
                        child: Column(
                          children: [
                            DayCard(onDaySelected: _onDaySelected),
                            ScheduleDoctorListView(scheduleDoctor: filteredSchedule),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
