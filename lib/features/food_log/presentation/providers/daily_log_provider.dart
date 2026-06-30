import 'package:calorie_tracker/core/utils/result.dart';
import 'package:calorie_tracker/features/food_log/domain/model/daily_log.dart';
import 'package:calorie_tracker/features/food_log/presentation/providers/selected_date_provider.dart';
import 'package:calorie_tracker/features/food_log/use_cases/use_cases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dailyLogProvider = FutureProvider<DailyLog>((ref) async {
  
  final selectedDate = ref.watch(selectedDateProvider);
  final getDailyLog = ref.watch(getDailyLogUseCaseProvider);
  final result = await getDailyLog(selectedDate);

  switch(result) {
    case Success(): return result.data;
    case Failure(): throw result.error;
  }
});