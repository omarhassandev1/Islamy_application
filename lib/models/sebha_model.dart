class SebhaModel {
  final String ayah;
  final String zekr;

  SebhaModel({required this.ayah, required this.zekr});

  static List<SebhaModel> azkar = [
    SebhaModel(ayah: 'سَبِّحِ اسْمَ رَبِّكَ الأعلى', zekr: 'سبحان الله'),
    SebhaModel(
      ayah: 'وَقُلِ الْحَمْدُ لِلَّهِ الَّذِي لَمْ يَتَّخِذْ وَلَدًا',
      zekr: 'الحمد لله',
    ),
    SebhaModel(
      ayah: 'فَاعْلَمْ أَنَّهُ لَا إِلَهَ إِلَّا اللَّهُ',
      zekr: 'لا إله إلا الله',
    ),
    SebhaModel(ayah: 'وَكَبِّرْهُ تَكْبِيرًا', zekr: 'الله أكبر'),
    SebhaModel(
      ayah: 'فَقُلْتُ اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا',
      zekr: 'أستغفر الله',
    ),
    SebhaModel(
      ayah: 'وَمَا تَوْفِيقِي إِلَّا بِاللَّهِ',
      zekr: 'لا حول ولا قوة إلا بالله',
    ),
  ];
}
