import 'package:calorie_tracker/features/food_log/data/repository/repository_providers.dart';
import 'package:calorie_tracker/features/food_log/use_cases/add_food_entry_use_case.dart';
import 'package:calorie_tracker/features/food_log/use_cases/delete_food_entry_use_case.dart';
import 'package:calorie_tracker/features/food_log/use_cases/get_daily_log_use_case.dart';
import 'package:calorie_tracker/features/food_log/use_cases/search_food_catalog_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addFoodEntryUseCaseProvider = Provider<AddFoodEntryUseCase>((ref) {
  return AddFoodEntryUseCase(ref.watch(foodEntryRepositoryProvider));
});

final deleteFoodEntryUseCaseProvider = Provider<DeleteFoodEntryUseCase> ((ref) {
  return DeleteFoodEntryUseCase(ref.watch(foodEntryRepositoryProvider));
});

final getDailyLogUseCaseProvider = Provider<GetDailyLogUseCase> ((ref) {
  return GetDailyLogUseCase(ref.watch(foodEntryRepositoryProvider));
});

final searchFoodCatalogUseCaseProvider = Provider<SearchFoodCatalogUseCase> ((ref) {
  return SearchFoodCatalogUseCase(ref.watch(foodItemRepositoryProvider));
});