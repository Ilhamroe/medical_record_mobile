import 'package:flutter/material.dart';

class HomePageDoctor extends StatefulWidget {
  const HomePageDoctor({super.key});

  @override
  State<HomePageDoctor> createState() => _HomePageDoctorState();
}

class _HomePageDoctorState extends State<HomePageDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("doctor page"),
      ),
      body: Center(
        child: Text("doctor page"),
      ),
    );
  }
}
