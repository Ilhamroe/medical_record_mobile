class User {
  final int id;
  final String name;
  final String nrp;
  final String email;
  final String role;
  final String? image;
  final String? gender;
  final String? birth;
  final String? number;
  final double? height;
  final double? weight;

  User({
    required this.id,
    required this.name,
    required this.nrp,
    required this.email,
    required this.role,
    this.image,
    this.gender,
    this.birth,
    this.number,
    this.height,
    this.weight,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      nrp: json['nrp'],
      email: json['email'],
      role: json['role'],
      image: json['image'] as String?,
      gender: json['gender'] as String?,
      birth: json['birth'] as String?,
      number: json['number'] as String?,
      height: (json['height'] != null) ? json['height'].toDouble() : null,
      weight: (json['weight'] != null) ? json['weight'].toDouble() : null,
    );
  }
}


// class User {
//   final int id;
//   final String nama;
//   final String alamat;
//   final String pekerjaan;
//   final String quote;
//   final String? prodi;

//   User({
//     required this.id,
//     required this.nama,
//     required this.alamat,
//     required this.pekerjaan,
//     required this.quote,
//     this.prodi,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       nama: json['nama'],
//       alamat: json['alamat'],
//       pekerjaan: json['pekerjaan'],
//       quote: json['quote'],
//       prodi: json['prodi']?.toString(),
//     );
//   }
// }