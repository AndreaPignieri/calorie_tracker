import 'package:calorie_tracker/core/utils/result.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_item.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_item_filter.dart';
import 'package:calorie_tracker/features/food_log/domain/repository/i_food_item_repository.dart';

class SearchFoodCatalogUseCase {
  final IFoodItemRepository repository;
  const SearchFoodCatalogUseCase(this.repository);

  Future<Result<List<FoodItem>, Exception>> call(FoodItemFilter foodItemFilter) async{
    if (foodItemFilter.isEmpty()) return Result.failure(Exception("Invalid or empty filter"));
    return await repository.filteredSearch(foodItemFilter);
  }
}