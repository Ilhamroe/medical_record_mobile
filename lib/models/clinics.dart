import 'users.dart';

class Clinic {
  final int id;
  final String doctor;
  final String patient;
  final String dated;
  final String symptom;
  final String diagnosis;
  final String drug;
  final String advice;

  Clinic({
    required this.id,
    required this.doctor,
    required this.patient,
    required this.dated,
    required this.symptom,
    required this.diagnosis,
    required this.drug,
    required this.advice,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      doctor: json['doctor'] ?? json['dokter'] ?? "",
      patient: json['name'] ?? json['patient'] ?? "",
      dated: json['dated'] ?? "",
      symptom: json['symptom'] ?? "",
      diagnosis: json['diagnosis'] ?? "",
      drug: json['drug'] ?? "",
    advice: json['advice'] ?? "",
    );
  }
}
