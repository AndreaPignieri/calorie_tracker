import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedDateNotifier extends Notifier<LogDate> {
  
  @override
  LogDate build() {
    return LogDate.now();
  }

  void goToPreviousDay() {
    state = state.previousDay;
  }

  void goToNextDay() {
    if (state == LogDate.now()) return;
    state = state.nextDay;
  }
  
  void setDate(LogDate newDate) {
    if (newDate.isAfter(LogDate.now())) return;
    state = newDate;
  }
}

final selectedDateProvider = NotifierProvider<SelectedDateNotifier, LogDate>(() {
  return SelectedDateNotifier();
});