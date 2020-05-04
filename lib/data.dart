class Hour {
  final String title;
  final String subtitle;
  Hour(this.title, this.subtitle);
}

final List<Hour> hourList = [
  Hour('11:00', "from \$10"),
  Hour('11:30', "from \$10"),
  Hour('12:00', "from \$10"),
  Hour('12:30', "from \$15"),
  Hour('14:00', "from \$5"),
];

class Date {
  final String title;
  final String subtitle;
  Date(this.title, this.subtitle);
}

final List<Date> dateList = [
  Date('9', "Th"),
  Date('10', "Fr"),
  Date('11', "Sa"),
  Date('12', "Su"),
  Date('13', "Mo"),
  Date('14', "Tu"),
  Date('15', "We"),
  Date('16', "Th"),
  Date('17', "Fr"),
];
