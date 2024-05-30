class RecentPatients{
  final String profilePhoto;
  final String name;
  final String nrp;

  const RecentPatients({
    required this.profilePhoto,
    required this.name,
    required this.nrp,
  });
}

List <RecentPatients> recentPatients=[
  const RecentPatients(
    profilePhoto: "assets/images/profiles-pic.jpg",
    name: "Muhammad Ilham Ramadani", 
    nrp: "3122500021",
  ),

  const RecentPatients(
    profilePhoto: "assets/images/profiles-pic.jpg",
    name: "Shofira Izza Nurrohmah", 
    nrp: "3122500026"
  ),

  const RecentPatients(
    profilePhoto: "assets/images/profiles-pic.jpg",
    name: "Arsyita Devanaya Arianto", 
    nrp: "3122500008"
  ),
];