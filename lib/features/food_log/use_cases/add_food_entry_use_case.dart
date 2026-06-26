import '../../../core/utils/result.dart';
import '../domain/model/food_entry.dart';
import '../domain/repository/i_food_entry_repository.dart';

class AddFoodEntryUseCase {
  final IFoodEntryRepository repository;
  const AddFoodEntryUseCase(this.repository);

  Future<Result<FoodEntry, Exception>> call(FoodEntry foodEntry) async {
    if (foodEntry.quantity <= 0) return Result.failure(Exception("Invalid quantity: must be higher than 0"));
    return await repository.upsert(foodEntry);
  }
}