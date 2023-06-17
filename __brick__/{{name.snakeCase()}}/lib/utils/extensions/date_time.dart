extension DateTimeExt on DateTime {
  int daysBetween([DateTime? date]) {
    final other = date ?? DateTime.now();

    final from = DateTime(year, month, day);
    final to = DateTime(other.year, other.month, other.day);
    return (to.difference(from).inHours / 24).round();
  }

  bool isToday() {
    return isSameDayAs(DateTime.now());
  }

  bool isSameDayAs(DateTime other) {
    final current = DateTime(year, month, day);
    return current.year == other.year &&
        current.month == other.month &&
        current.day == other.day;
  }

  String get parse {
    DateTime today = DateTime.now();
    Duration oneDay = const Duration(days: 1);
    Duration twoDays = const Duration(days: 2);
    Duration oneWeek = const Duration(days: 7);
    // map months to strings
    const months = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec',
    };

    String month = months[this.month]!;

    Duration difference = today.difference(this);

    if (difference.compareTo(oneDay) < 1) {
      return "Today";
    } else if (difference.compareTo(twoDays) < 1) {
      return "Yesterday";
    } else if (difference.compareTo(oneWeek) < 1) {
      // map weekdays to strings
      const weekdays = {
        1: 'Mon',
        2: 'Tue',
        3: 'Wed',
        4: 'Thu',
        5: 'Fri',
        6: 'Sat',
        7: 'Sun',
      };

      return weekdays[weekday]!;
    } else if (year == today.year) {
      return '$day $month';
    } else {
      return '$day $month $year';
    }
  }
}
