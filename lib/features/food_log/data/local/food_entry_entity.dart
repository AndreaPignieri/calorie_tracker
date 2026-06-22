import 'package:calorie_tracker/core/utils/meal_type.dart';
import 'package:calorie_tracker/features/food_log/data/local/food_item_entity.dart';
import 'package:objectbox/objectbox.dart';


@Entity()
class FoodEntryEntity {
  @Id()
  int id = 0;
  
  final foodItem = ToOne<FoodItemEntity>();
  
  @Property(type: PropertyType.date)
  DateTime dateTime = DateTime.now();

  double quantity = 0;

  MealType mealType = MealType.lunch;
}