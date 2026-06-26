import 'package:calorie_tracker/features/food_log/data/local/food_entry_entity.dart';
import 'package:calorie_tracker/features/food_log/data/local/food_item_entity.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_entry.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_item.dart';
import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';

extension FoodEntryEntityMapper on FoodEntryEntity {
  FoodEntry toDomain() {
    final targetItem = foodItem.target;

    if (targetItem == null) {
      throw Exception('Database Error: FoodItem mancante per la FoodEntry con id $id');
    }

    return FoodEntry(
    logDate : LogDate.fromDateTime(dateTime),
    id : id,
    quantity : quantity,
    mealType: mealType,
    foodItem : targetItem.toDomain()
    );
  }
}

extension FoodEntryMapper on FoodEntry {
  FoodEntryEntity toEntity() {
    return FoodEntryEntity()
    ..id = id
    ..foodItem.targetId = foodItem.id
    ..dateTime = logDate.toDateTime()
    ..quantity = quantity
    ..mealType = mealType;
  }
}


extension FoodItemEntityMapper on FoodItemEntity {
  FoodItem toDomain() {
    return FoodItem(
      id: id, 
      barcode: barcode, 
      name: name, 
      brand: brand, 
      caloriesPer100g: caloriesPer100g, 
      carbsPer100g: carbsPer100g, 
      proteinPer100g: proteinPer100g, 
      fatsPer100g: fatsPer100g, 
      fiberPer100g: fiberPer100g, 
      servingSizeWeight: servingSizeWeight,
      servingSizeName: servingSizeName,
      allergies: allergies);
  }
}

extension FoodItemMapper on FoodItem {
  FoodItemEntity toEntity() {
    return FoodItemEntity()
    ..id = id
    ..barcode = barcode
    .. name = name
    ..brand = brand
    ..caloriesPer100g = caloriesPer100g
    ..carbsPer100g = carbsPer100g
    ..proteinPer100g = proteinPer100g
    ..fatsPer100g = fatsPer100g
    ..fiberPer100g = fiberPer100g
    ..servingSizeWeight = servingSizeWeight
    ..servingSizeName = servingSizeName
    ..allergies = allergies;
  }
}