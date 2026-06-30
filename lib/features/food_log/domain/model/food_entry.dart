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

  factory FoodEntry.create(LogDate logDate, FoodItem foodItem, double quantity, MealType mealType) {
    return FoodEntry(id:0, logDate: logDate, foodItem: foodItem, quantity: quantity, mealType: mealType);
  }

  int get calories => ((foodItem.caloriesPer100g * quantity) / 100).round();
  int get proteins => ((foodItem.proteinPer100g * quantity) / 100).round();
  int get carbs => ((foodItem.carbsPer100g * quantity) / 100).round();
  int get fats => ((foodItem.fatsPer100g * quantity) / 100).round();
  int get fibers => ((foodItem.fiberPer100g * quantity) / 100).round();
}