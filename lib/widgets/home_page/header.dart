import 'package:flutter/material.dart';

class Header extends StatelessWidget {
   const Header({super.key});

  @override
  Widget build(BuildContext context) {
   
    final Size screenSize = MediaQuery.of(context).size;
    final double fontSize = screenSize.width * 0.04;

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
        bottom: 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hello Mirta!',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Cek Hasil rekam medismu',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          CircleAvatar(
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}