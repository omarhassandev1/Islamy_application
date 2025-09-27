class ZekrCategory{
  final String title;
  final String image;

  ZekrCategory(this.title, this.image);

  static List<ZekrCategory> azkarCategories = [
    ZekrCategory('Evening Azkar', 'assets/images/prayers_time/azkar/image1.png'),
    ZekrCategory('Morning Azkar', 'assets/images/prayers_time/azkar/image2.png'),
    ZekrCategory('Waking Azkar', 'assets/images/prayers_time/azkar/image3.png'),
    ZekrCategory('Sleeping Azkar', 'assets/images/prayers_time/azkar/image4.png'),
  ];
}