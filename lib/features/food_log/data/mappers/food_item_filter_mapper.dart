import 'package:calorie_tracker/features/food_log/domain/model/food_item_filter.dart';
import 'package:calorie_tracker/features/food_log/data/local/food_item_entity.dart';
import 'package:calorie_tracker/objectbox.g.dart'; 

extension FoodItemFilterMapper on FoodItemFilter {
  Condition<FoodItemEntity>? toObjectBoxCondition() {
    final conditions = <Condition<FoodItemEntity>>[];


    if (barcode != null && barcode!.isNotEmpty) {
      conditions.add(FoodItemEntity_.barcode.equals(barcode!));
    }
    if (brand != null && brand!.isNotEmpty) {
      conditions.add(FoodItemEntity_.brand.equals(brand!, caseSensitive: false));
    }
    if (name != null && name!.isNotEmpty) {
      conditions.add(FoodItemEntity_.name.contains(name!, caseSensitive: false));
    }
    if (minCaloriesPer100g != null) {
      conditions.add(FoodItemEntity_.caloriesPer100g.greaterOrEqual(minCaloriesPer100g!));
    }
    if (maxCaloriesPer100g != null) {
      conditions.add(FoodItemEntity_.caloriesPer100g.lessOrEqual(maxCaloriesPer100g!));
    }
    if (minCarbsPer100g != null) {
      conditions.add(FoodItemEntity_.carbsPer100g.greaterOrEqual(minCarbsPer100g!));
    }
    if (maxCarbsPer100g != null) {
      conditions.add(FoodItemEntity_.carbsPer100g.lessOrEqual(maxCarbsPer100g!));
    }
    if (minProteinPer100g != null) {
      conditions.add(FoodItemEntity_.proteinPer100g.greaterOrEqual(minProteinPer100g!));
    }
    if (maxProteinPer100g != null) {
      conditions.add(FoodItemEntity_.proteinPer100g.lessOrEqual(maxProteinPer100g!));
    }
    if (minFatsPer100g != null) {
      conditions.add(FoodItemEntity_.fatsPer100g.greaterOrEqual(minFatsPer100g!));
    }
    if (maxFatsPer100g != null) {
      conditions.add(FoodItemEntity_.fatsPer100g.lessOrEqual(maxFatsPer100g!));
    }
    if (minFiberPer100g != null) {
      conditions.add(FoodItemEntity_.fiberPer100g.greaterOrEqual(minFiberPer100g!));
    }
    if (maxFiberPer100g != null) {
      conditions.add(FoodItemEntity_.fiberPer100g.lessOrEqual(maxFiberPer100g!));
    }
    if (minServingSizeWeight != null) {
      conditions.add(FoodItemEntity_.servingSizeWeight.greaterOrEqual(minServingSizeWeight!));
    }
    if (maxServingSizeWeight != null) {
      conditions.add(FoodItemEntity_.servingSizeWeight.lessOrEqual(maxServingSizeWeight!));
    }
    if (servingSizeName != null && servingSizeName!.isNotEmpty) {
      conditions.add(FoodItemEntity_.servingSizeName.equals(servingSizeName!, caseSensitive: false));
    }
    if (conditions.isEmpty) return null;
    return conditions.reduce((a, b) => a & b);
  }
}