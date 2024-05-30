class PatientData{
  final String profilePhoto;
  final String name;
  final String nrp;
  final String trailing1;
  final String trailing2;

  const PatientData({
    required this.profilePhoto, 
    required this.name, 
    required this.nrp,
    required this.trailing1,
    required this.trailing2, 
  });
}

final List<PatientData> patientsData=[
  const PatientData(
    profilePhoto: "assets/images/profile.png", 
    name: "Ilham Ramadani", 
    nrp: "3122500021",
    trailing1: "assets/images/tabler_edit.png",
    trailing2: "assets/images/mynaui_trash.png",
  ),
  const PatientData(
    profilePhoto: "assets/images/profile.png", 
    name: "Rifqi Rayita", 
    nrp: "3122500027",
    trailing1: "assets/images/tabler_edit.png",
    trailing2: "assets/images/mynaui_trash.png",
  ),
  const PatientData(
    profilePhoto: "assets/images/profile.png", 
    name: "Syahrul Ramadhan", 
    nrp: "3122500030",
    trailing1: "assets/images/tabler_edit.png",
    trailing2: "assets/images/mynaui_trash.png",
  ),
];
