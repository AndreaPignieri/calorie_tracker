final class LogDate {
  final int day;
  final int month;
  final int year;

  //Const makes Dart reuse the same instance of an object instead of creating a new one
  const LogDate({
    required this.day,
    required this.month,
    required this.year
  });

  factory LogDate.fromDateTime(DateTime dateTime){
    final safeUtcDate = dateTime.isUtc ? dateTime : dateTime.toUtc();
    return LogDate(day: safeUtcDate.day, month: safeUtcDate.month, year: safeUtcDate.year);
  }

  factory LogDate.now(){
    return LogDate.fromDateTime(DateTime.now());
  }

  DateTime toDateTime() {
    return DateTime.utc(year, month, day);
  }

  bool isAfter(LogDate logDate) {
    return toDateTime().isAfter(logDate.toDateTime());
  }

  bool isBefore(LogDate logDate) {
    return toDateTime().isBefore(logDate.toDateTime());
  }

  LogDate get previousDay {
  final prev = toDateTime().subtract(const Duration(days: 1));
  return LogDate.fromDateTime(prev);
}

LogDate get nextDay {
  final next = toDateTime().add(const Duration(days: 1));
  return LogDate.fromDateTime(next);
}

  @override
  bool operator ==(Object other) => identical(this, other)  
    || other is LogDate
    && day == other.day 
    && month == other.month 
    && year == other.year;

  @override
  int get hashCode => Object.hash(day, month, year);

  
}