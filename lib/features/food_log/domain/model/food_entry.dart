import 'package:calorie_tracker/core/utils/meal_type.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_item.dart';
import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';


class FoodEntry {
  final int id;
  final FoodItem foodItem;
  final LogDate logDate;
  final double quantity;
  final MealType mealType;

  FoodEntry({
    required this.id,
    required this.logDate,
    required this.foodItem,
    required this.quantity,
    required this.mealType
  });
}