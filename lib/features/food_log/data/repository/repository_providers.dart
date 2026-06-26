import 'package:calorie_tracker/features/food_log/data/local/food_entry_entity.dart';
import 'package:calorie_tracker/features/food_log/data/local/food_item_entity.dart';
import 'package:calorie_tracker/features/food_log/data/repository/objectbox_food_item_repository.dart';
import 'package:calorie_tracker/features/food_log/domain/repository/i_food_item_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calorie_tracker/features/food_log/domain/repository/i_food_entry_repository.dart';
import 'package:calorie_tracker/features/food_log/data/repository/objectbox_food_entry_repository.dart';
import 'package:calorie_tracker/core/database/database_providers.dart';

final foodEntryRepositoryProvider = Provider<IFoodEntryRepository>((ref) {
  return ObjectboxFoodEntryRepository(foodEntryBox: ref.watch(objectBoxStoreProvider).box<FoodEntryEntity>()); 
});

final foodItemRepositoryProvider = Provider<IFoodItemRepository> ((ref) {
  return ObjectboxFoodItemRepository(foodItemBox: ref.watch(objectBoxStoreProvider).box<FoodItemEntity>());
});