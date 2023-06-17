extension NumExt on num {
  /// Render numbers as currency values
  String get currency {
    final number = round().toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );

    // return '₦ $number';
    return 'N $number';
  }

  /// Format number with spaces and commas
  String get format {
    final number = round().toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );

    return number;
  }

  String get shorten {
    const units = <int, String>{
      1000000000: 'B',
      1000000: 'M',
      1000: 'K',
    };
    return units.entries
        .map((e) => '${this ~/ e.key}${e.value}')
        .firstWhere((e) => !e.startsWith('0'), orElse: () => '$this');
  }

  String get shortenCurrency {
    return 'N $shorten';
  }

  bool isToday({bool isUtc = false}) {
    if (toInt() == 0) return false;
    DateTime old = DateTime.fromMillisecondsSinceEpoch(toInt(), isUtc: isUtc);
    DateTime now;
    now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  bool _yearIsEqual(DateTime dateTime, DateTime locDateTime) {
    return dateTime.year == locDateTime.year;
  }

  bool yearIsEqualByMs(int locMs) {
    return _yearIsEqual(
      DateTime.fromMillisecondsSinceEpoch(toInt()),
      DateTime.fromMillisecondsSinceEpoch(locMs),
    );
  }

  get getDateNowMs => DateTime.now().millisecondsSinceEpoch;
}
