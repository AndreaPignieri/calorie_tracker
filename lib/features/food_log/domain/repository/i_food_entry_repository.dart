import 'package:calorie_tracker/features/food_log/domain/model/food_entry.dart';
import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';
import 'package:calorie_tracker/core/utils/result.dart';

abstract interface class IFoodEntryRepository {
  Future<Result<FoodEntry, Exception>> create(FoodEntry foodEntry);
  Future<Result<FoodEntry, Exception>> getById(int id);
  Future<Result<List<FoodEntry>, Exception>> getByDate(LogDate logDate);
  Future<Result<FoodEntry, Exception>> update(FoodEntry foodEntry);
  Future<Result<void, Exception>> delete(int id);
}