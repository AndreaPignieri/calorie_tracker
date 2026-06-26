import '../../../core/utils/result.dart';
import '../domain/repository/i_food_entry_repository.dart';

class DeleteFoodEntryUseCase {
  final IFoodEntryRepository repository;
  const DeleteFoodEntryUseCase(this.repository);

  Future<Result<void, Exception>> call(int id) async {
    if (id<=0) return Result.failure(Exception("Invalid ID"));
    return await repository.delete(id);
  }
}