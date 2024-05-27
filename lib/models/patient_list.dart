class Patient {
  final String name;
  final String nrp;
  final String details;
  final String profilePicture;

  Patient({
    required this.name,
    required this.nrp,
    required this.details,
    required this.profilePicture,
  });
}

class PatientContents {
  static List<Patient> patientLists = [
    Patient(name: 'Ade Hafis Rabbani', nrp: '3122500001', details: 'Detail 1', profilePicture: 'assets/images/profile1.png'),
    Patient(name: 'Nadila Aulia Mirdianti', nrp: '3122500002', details: 'Detail 2', profilePicture: 'assets/images/profile2.png'),
    Patient(name: 'Zahrotul Hidayah', nrp: '3122500003', details: 'Detail 3', profilePicture: 'assets/images/profile3.png'),
    Patient(name: 'Denti Widayati', nrp: '3122500004', details: 'Detail 4', profilePicture: 'assets/images/profile4.png'),
    Patient(name: 'Ari Yoga', nrp: '3122500005', details: 'Detail 5', profilePicture: 'assets/images/profile5.png'),
    Patient(name: 'Ilham Ramadhani', nrp: '3122500020', details: 'Detail 6', profilePicture: 'assets/images/profile6.png'),
    Patient(name: 'Rifqi Rayita', nrp: '3122500025', details: 'Detail 7', profilePicture: 'assets/images/profile7.png'),
    Patient(name: 'Syahrul Ramadhan', nrp: '3122500030', details: 'Detail 8', profilePicture: 'assets/images/profile8.png'),
  ];
}
