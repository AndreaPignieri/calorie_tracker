import 'package:calorie_tracker/core/utils/result.dart';
import 'package:calorie_tracker/features/food_log/domain/model/daily_log.dart';
import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';
import '../domain/repository/i_food_entry_repository.dart';

class GetDailyLogUseCase {
  final IFoodEntryRepository repository;
  const GetDailyLogUseCase(this.repository);

  Future<Result<DailyLog, Exception>> call(LogDate logDate) async {
    if (logDate.toDateTime().isAfter(LogDate.now().toDateTime())) return Result.failure(Exception("Date has to be before today"));
    return await repository.getDailyLog(logDate);
  }
}