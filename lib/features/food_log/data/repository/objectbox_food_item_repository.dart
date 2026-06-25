import 'package:calorie_tracker/features/food_log/domain/repository/i_food_item_repository.dart';
import 'package:calorie_tracker/features/food_log/data/mappers/food_item_filter_mapper.dart';
import 'package:calorie_tracker/features/food_log/data/mappers/food_log_mappers.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_item_filter.dart';
import 'package:calorie_tracker/features/food_log/data/local/food_item_entity.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_item.dart';
import 'package:calorie_tracker/core/utils/result.dart';
import 'package:calorie_tracker/objectbox.g.dart';

class ObjectboxFoodItemRepository implements IFoodItemRepository {

  final Box<FoodItemEntity> foodItemBox;
  ObjectboxFoodItemRepository({required this.foodItemBox});

  @override
  Future<Result<FoodItem, Exception>> getById(int id) async {
    try {
      final data = foodItemBox.get(id);

      if (data==null) throw Exception("Unable to find entity with corresponding id");

      return Result.success(data.toDomain());

    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }
  
  @override
  Future<Result<List<FoodItem>, Exception>> filteredSearch(FoodItemFilter filter) async {
    try {
      final queryBuilder = foodItemBox.query(filter.toObjectBoxCondition());
      
      final query = queryBuilder.build();

      Iterable<FoodItemEntity> entities = query.find();
      query.close();

      if (filter.excludeAllergies != null && filter.excludeAllergies!.isNotEmpty) {
        entities = entities.where((item) {
          final hasExcludedAllergy = filter.excludeAllergies!.any(
            (allergy) => item.allergies?.contains(allergy) ?? false,
          );
          return !hasExcludedAllergy;
        });
      }
      
      final List<FoodItem> domainItems = entities.map((entity) => entity.toDomain()).toList();

      return Result.success(domainItems);
    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }
}