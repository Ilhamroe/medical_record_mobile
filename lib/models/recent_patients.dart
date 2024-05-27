import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecentPatients{
  String profilePhoto;
  String name;
  String nrp;

  RecentPatients({
    required this.profilePhoto,
    required this.name,
    required this.nrp
  });
}

List <RecentPatients> recentPatients=[
  RecentPatients(
    profilePhoto: "assets/images/profiles-pic.jpg",
    name: "Muhammad Ilham Ramadani", 
    nrp: "3122500021"
  ),

    RecentPatients(
    profilePhoto: "assets/images/profiles-pic.jpg",
    name: "Shofira Izza Nurrohmah", 
    nrp: "3122500026"
  ),

    RecentPatients(
    profilePhoto: "assets/images/profiles-pic.jpg",
    name: "Arsyita Devanaya Arianto", 
    nrp: "3122500008"
  ),
];