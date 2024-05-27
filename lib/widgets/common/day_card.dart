import 'package:flutter/material.dart';
import 'package:e_klinik_pens/utils/color.dart';

class DayCard extends StatefulWidget {
  final ValueChanged<String> onDaySelected;

  const DayCard({required this.onDaySelected, super.key});

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  final daysOfWeek = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat'];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(daysOfWeek.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onDaySelected(daysOfWeek[index]);
                },
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? themeDark : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        daysOfWeek[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == index ? Colors.white : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
