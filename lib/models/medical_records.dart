class MedicalRecordsUser{
  final String checkDate;
  final String doctor;
  String? patient;
  final String symptoms;
  final String diagnose;
  final String medicine;
  final String advice;

  MedicalRecordsUser({
    required this.checkDate,
    required this.doctor,
    this.patient,
    required this.symptoms,
    required this.diagnose,
    required this.medicine,
    required this.advice
  });
}

final List<MedicalRecordsUser> medicalRecordsUser=[
   MedicalRecordsUser(
    checkDate: '01 Mei 2024', 
    doctor: 'dr. M. Dwiya Lakhsmana', 
    patient: 'M. Ilham Ramadani',
    symptoms: '• Minum obat 2x sehari\n'
              '• Minum air putih yang cukup sepanjang hari untuk menjaga hidrasi.\n'
              '• Istirahat dan hindari stres berlebihan.\n'
              '• Jangan makan makanan pedas, asam.',
    diagnose: 'Maag', 
    medicine: 'Mylanta', 
    advice: '• Minum bensin 2x sehari\n'
            '• Minum air rondap yang cukup sepanjang hari untuk menjaga hidrasi.\n'
            '• Istirahat dan hindari ngoding berlebihan.\n'
            '• Jangan makan makanan enak, asam.',
  ),
   MedicalRecordsUser(
    checkDate: '24 Mei 2024', 
    doctor: 'dr. Firza Shafrina Izzati', 
    patient: 'M. Ilham Ramadani',
    symptoms: '• Minum bensin 2x sehari\n'
              '• Minum air rondap yang cukup sepanjang hari untuk menjaga hidrasi.\n'
              '• Istirahat dan hindari ngoding berlebihan.\n'
              '• Jangan makan makanan enak, asam.',
    diagnose: 'Demam', 
    medicine: 'Demacolin', 
    advice: '• Minum obat 2x sehari\n'
            '• Minum air putih yang cukup sepanjang hari untuk menjaga hidrasi.\n'
            '• Istirahat dan hindari stres berlebihan.\n'
            '• Jangan makan makanan pedas, asam.',
  ),
];