import 'package:calorie_tracker/core/utils/result.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_entry.dart';
import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';
import '../domain/repository/i_food_entry_repository.dart';

class GetDailyLogUseCase {
  final IFoodEntryRepository repository;
  const GetDailyLogUseCase(this.repository);

  Future<Result<List<FoodEntry>, Exception>> call(LogDate logDate) async {
    if (logDate.toDateTime().isAfter(LogDate.now().toDateTime())) return Result.failure(Exception("Date has to be before today"));
    return await repository.getByDate(logDate);
  }
}