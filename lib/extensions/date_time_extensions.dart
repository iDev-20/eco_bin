import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String format(String pattern) {
    var format = DateFormat(pattern);
    return format.format(this);
  }

  String friendlyTime() {
    var format = DateFormat('hh:mm a');
    return format.format(this);
  }

  String friendlyMonthYear() {
    return DateFormat('MMMM, yyyy').format(this);
  }

  String friendlyMonth() {
    return DateFormat('MMMM').format(this);
  }

  String friendlyDayMonth() {
    return DateFormat('d MMMM').format(this);
  }

  String friendlyDayMonthShort() {
    return DateFormat('d MMM').format(this);
  }

  String systemDateFormat() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String systemDateMonthFormat() {
    return DateFormat('MM-yyyy').format(this);
  }

  String friendlyDate() {
    var format = DateFormat.yMMMd();
    return format.format(this);
  }

  String friendlySlashDate() {
    return DateFormat("MM/dd/yyyy").format(this);
  }

  String fullFriendlyDate() {
    var format = DateFormat.yMMMMd();
    return format.format(this);
  }

  String fullFriendlyDateWithWeekDay() {
    var format = DateFormat.yMMMMEEEEd();
    return format.format(this);
  }

  String friendlyDateMonth() {
    var format = DateFormat.yMMM();
    return format.format(this);
  }

  String friendlyDateTime({bool? newLine}) {
    var format = DateFormat.jm();
    return '${friendlyDate()}${newLine == true ? "\n" : " • "}${format.format(this)}';
  }

  //transaction dateTime

  String transactionDateTime({bool? newLine}) {
    final time = DateFormat.jm().format(this);
    final date = _friendlyDayLabel();
    return '$date${newLine == true ? "\n" : " • "}$time';
  }

  String _friendlyDayLabel() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(year, month, day);
    final difference = today.difference(dateOnly).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '$difference days ago';
    } else {
      return DateFormat.yMMMd().format(this);
    }
  }

  String formatMediumDate() {
    var format = DateFormat('EE, dd MMM yyyy');
    return format.format(this);
  }

  DateTime getDay(int dayOfWeek) {
    return subtract(Duration(days: weekday - dayOfWeek));
  }

  DateTime previousMonth() {
    return DateTime(year, month - 1, day);
  }

  DateTime getLastNMonth({required int number}) {
    DateTime now = DateTime.now();

    // Get the current month and year
    int currentMonth = now.month;
    int currentYear = now.year;

    // Subtract three months from the current month
    int nMonthsAgo = currentMonth - number;

    // Adjust the month value and year if it goes below 1
    if (nMonthsAgo < 1) {
      nMonthsAgo += 12;
      currentYear--;
    }

    return DateTime(currentYear, nMonthsAgo, now.day);
  }

  int getNumberOfDaysInMonth() {
    // Get the next month by adding 1 to the current month
    var firstDayOfMonth = getFirstDayOfMonth();
    DateTime nextMonth = DateTime(year, month + 1, 1);

    // Subtract the current date from the next month's first day to get the duration
    Duration duration = nextMonth.difference(firstDayOfMonth);

    // Subtract 1 day to get the number of days in the current month
    int numberOfDays = duration.inDays;

    return numberOfDays;
  }

  DateTime getFirstDayOfMonth() {
    return DateTime(year, month, 1);
  }

  DateTime getDaysAgo({required numberOfDays}) {
    return subtract(Duration(days: numberOfDays));
  }

  List<DateTime> getAllDaysFromNDaysAgo({required numberOfDays}) {
    List<DateTime> days = [];
    var n = numberOfDays;

    //to include yesterday
    if (numberOfDays == 1) {
      n = numberOfDays + 1;
    }
    for (var i = 0; i < n; i++) {
      days.add(subtract(Duration(days: i)));
    }

    return days;
  }

  DateTime firstDayOfWeek() {
    // Subtract the current day of the week from the given date to get the first day
    int offset = weekday == DateTime.sunday ? 0 : weekday;
    return subtract(Duration(days: offset));
  }

  DateTime getLastDayOfMonth() {
    // Add 1 month and subtract 1 day from the current date
    DateTime nextMonth = DateTime(year, month + 1, 1);
    return nextMonth.subtract(const Duration(days: 1));
  }

  int getDayOfYear() {
    // Create a new DateTime object for the start of the year
    DateTime startOfYear = DateTime(year, 1, 1);

    // Get the difference in days between the current date and the start of the year
    int dayOfYear = difference(startOfYear).inDays + 1;

    return dayOfYear;
  }

  String getWeekdayName() {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return 'Unknown';
    }
  }
}
