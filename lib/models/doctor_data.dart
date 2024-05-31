class DoctorData{
  final String profilePhoto;
  final String name;
  final String role;
  final String exp;

  const DoctorData({
    required this.profilePhoto, 
    required this.name, 
    required this.role, 
    required this.exp
  });
}

final List<DoctorData> doctorsData=[
  const DoctorData(
    profilePhoto: "assets/images/profile.png", 
    name: "dr. M. Dwiya Lakhsmana", 
    role: "Umum", 
    exp: "4 Tahun"
  ),
  const DoctorData(
    profilePhoto: "assets/images/profile.png", 
    name: "dr. Firza Sharfina Izzati", 
    role: "Umum", 
    exp: "3 Tahun"
  ),
  const DoctorData(
    profilePhoto: "assets/images/profile.png", 
    name: "dr. Budi Utomo",
    role: "Umum", 
    exp: "5 Tahun"
  ),
];