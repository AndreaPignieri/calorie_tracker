import 'dart:async';
import 'package:calorie_tracker/core/utils/meal_type.dart';
import 'package:calorie_tracker/core/utils/result.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_entry.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_item.dart';
import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';
import 'package:calorie_tracker/features/food_log/presentation/providers/daily_log_provider.dart';
import 'package:calorie_tracker/features/food_log/use_cases/use_cases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FoodLogActionNotifier extends AsyncNotifier<void> {
  
  @override
  FutureOr<void> build() {
  }

  Future<void> addFoodEntry(LogDate logDate, FoodItem foodItem, double quantity, MealType mealType) async {

    state = const AsyncLoading();

    final addFoodEntryUseCase = ref.read(addFoodEntryUseCaseProvider);
    final result = await addFoodEntryUseCase(FoodEntry.create(logDate, foodItem, quantity, mealType));

    switch (result) {
      case Success():
        state = const AsyncData(null);
        ref.invalidate(dailyLogProvider);
        
      case Failure():
        state = AsyncError(result.error, StackTrace.current);
    }
  }

  Future<void> deleteFoodEntry(int id) async {
    state = const AsyncLoading();

    final deleteFoodEntryUseCase = ref.read(deleteFoodEntryUseCaseProvider);

    final result = await deleteFoodEntryUseCase(id);

    switch (result) {
      case Success():
        state = const AsyncData(null);
        ref.invalidate(dailyLogProvider);
      case Failure():
        state = AsyncError(result.error, StackTrace.current);
    }
  }
}

final foodLogActionProvider = AsyncNotifierProvider<FoodLogActionNotifier, void>(() {
  return FoodLogActionNotifier();
});