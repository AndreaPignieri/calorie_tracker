import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedDateNotifier extends Notifier<LogDate> {
  
  @override
  LogDate build() {return LogDate.now();}

  void goToPreviousDay() {
    state=LogDate(day:state.day-1, month:state.month, year:state.year);
  }

  void goToNextDay() {
    if(state==LogDate.now()) return;
    state=LogDate(day: state.day+1, month: state.month, year: state.year);
  }
  
  void setDate(LogDate newDate) {
    if(newDate.toDateTime().isAfter(LogDate.now().toDateTime())) return;
    state=newDate;
  }
}

final selectedDateProvider = NotifierProvider<SelectedDateNotifier, LogDate>(() {
  return SelectedDateNotifier();
});