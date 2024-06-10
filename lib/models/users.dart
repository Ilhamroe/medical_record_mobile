class User {
  final int id;
  final String name;
  final String nrp;
  final String email;
  final String password;
  final String role;
  final String? image;
  final String? gender;
  final String? birth;
  final String? number;
  final double? height;
  final double? weight;
  final String? description;
  final DateTime lastLogin;

  User({
    required this.id,
    required this.name,
    required this.nrp,
    required this.email,
    required this.password,
    required this.role,
    this.image,
    this.gender,
    this.birth,
    this.number,
    this.height,
    this.weight,
    this.description,
    required this.lastLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? '',
      nrp: json['nrp'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      role: json['role'] ?? '',
      image: json['image'] as String?,
      gender: json['gender'] as String?,
      birth: json['birth'] as String?,
      number: json['number'] as String?,
      height: (json['height'] != null) ? json['height'].toDouble() : null,
      weight: (json['weight'] != null) ? json['weight'].toDouble() : null,
      description: json['description'] as String?,
      lastLogin: json['lastLogin'] != null
          ? DateTime.parse(json['lastLogin'])
          : DateTime.now(),
    );
  }
}
