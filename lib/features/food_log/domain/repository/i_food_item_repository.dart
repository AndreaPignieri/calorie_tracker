import 'package:calorie_tracker/core/utils/result.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_item.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_item_filter.dart';

abstract interface class IFoodItemRepository {
  Future<Result<FoodItem, Exception>> upsert(FoodItem foodItem);
  Future<Result<FoodItem, Exception>> get(int id);
  Future<Result<List<FoodItem>, Exception>> filteredSearch(FoodItemFilter foodItemFilter);
}