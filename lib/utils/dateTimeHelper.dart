class DateTimeHelper {
  static final DateTimeHelper instance = DateTimeHelper._internal();
  DateTimeHelper._internal();

  DateTime toDateTime({required int year, String? month}) {
    // Determine the integer associated with the month string
    int? monthInteger;
    switch (month) {
      case 'Jan':
        monthInteger = DateTime.january;
        break;
      case 'Feb':
        monthInteger = DateTime.february;
        break;
      case 'Mar':
        monthInteger = DateTime.march;
        break;
      case 'Apr':
        monthInteger = DateTime.april;
        break;
      case 'May':
        monthInteger = DateTime.may;
        break;
      case 'Jun':
        monthInteger = DateTime.june;
        break;
      case 'Jul':
        monthInteger = DateTime.july;
        break;
      case 'Aug':
        monthInteger = DateTime.august;
        break;
      case 'Sep':
        monthInteger = DateTime.september;
        break;
      case 'Oct':
        monthInteger = DateTime.october;
        break;
      case 'Nov':
        monthInteger = DateTime.november;
        break;
      case 'Dec':
        monthInteger = DateTime.december;
        break;
    }

    if (monthInteger != null) {
      return DateTime(year, monthInteger);
    }

    return DateTime(year);
  }
}
