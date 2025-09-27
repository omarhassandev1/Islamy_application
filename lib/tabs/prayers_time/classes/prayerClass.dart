class Prayer {
  String name;
  String time;
  String toMidday;
  Prayer({required this.name, required this.time, required this.toMidday});

  static List<Prayer> prayers = [
  Prayer(name: 'Fajr', time: '05:34', toMidday: 'AM'),
  Prayer(name: 'Dhuhr', time: '01:01', toMidday: 'PM'),
  Prayer(name: 'ASR', time: '04:38', toMidday: 'PM'),
  Prayer(name: 'Maghrib', time: '07:57', toMidday: 'PM'),
  Prayer(name: 'Isha', time: '09:57', toMidday: 'PM'),

];
}

