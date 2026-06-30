import 'package:calorie_tracker/features/food_log/domain/model/daily_log.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_entry.dart';
import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';
import 'package:calorie_tracker/core/utils/result.dart';

abstract interface class IFoodEntryRepository {
  Future<Result<FoodEntry, Exception>> upsert(FoodEntry foodEntry);
  Future<Result<FoodEntry, Exception>> get(int id);
  Future<Result<DailyLog, Exception>> getDailyLog(LogDate logDate);
  Future<Result<void, Exception>> delete(int id);
}