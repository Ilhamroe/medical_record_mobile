class OnBoardItems {
  final String image;
  final String title;

  OnBoardItems(
      {required this.image,
      required this.title,});
}

class OnboardData {
  static List<OnBoardItems> onBoardItemList = [
    OnBoardItems(
      image: 'assets/images/man_doctor.png',
      title: "Percayakan kesehatan Anda pada Pens Medical",
    ),
    OnBoardItems(
      image: 'assets/images/woman_doctor.png',
      title: "Akses rekam medis Anda melalui E-KLINIK PENS",
    ),
  ];
}