
import 'package:calorie_tracker/features/food_log/domain/model/food_entry.dart';
import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';

class DailyLog {
  final LogDate date;
  final List<FoodEntry> entries;

  DailyLog({
    required this.date,
    required this.entries,
  });

  int get dailyCalories => entries.fold(0, (sum, entry) => sum + entry.calories);
  int get totalProteins => entries.fold(0, (sum, entry) => sum + entry.proteins);
  int get totalCarbs => entries.fold(0, (sum, entry) => sum + entry.carbs);
  int get totalFats => entries.fold(0, (sum, entry) => sum + entry.fats);
  int get totalFibers => entries.fold(0, (sum, entry) => sum + entry.fibers);
  
}