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
    return LogDate(day: dateTime.day, month: dateTime.month, year: dateTime.year);
  }

  factory LogDate.now(){
    return LogDate.fromDateTime(DateTime.now());
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