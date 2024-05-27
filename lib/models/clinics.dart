import 'users.dart';

class Clinic {
  final int id;
  final User doctor;
  final User patient;
  final String symptom;
  final String diagnosis;
  final String drug;
  final String advice;

  Clinic({
    required this.id,
    required this.doctor,
    required this.patient,
    required this.symptom,
    required this.diagnosis,
    required this.drug,
    required this.advice,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      doctor: User.fromJson(json['doctor']),
      patient: User.fromJson(json['patient']),
      symptom: json['symptom'],
      diagnosis: json['diagnosis'],
      drug: json['drug'],
      advice: json['advice'],
    );
  }
}