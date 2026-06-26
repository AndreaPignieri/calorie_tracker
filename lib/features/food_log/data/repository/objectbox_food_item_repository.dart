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
  Future<Result<FoodItem, Exception>> upsert(FoodItem foodItem) async{
    try {
      final toSave = foodItem.toEntity();
      final newId = foodItemBox.put(toSave);
      final savedItem = foodItemBox.get(newId);
      
      if (savedItem == null) throw Exception('Read error after creation');
      
      return Result.success(savedItem.toDomain());

    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }

  @override
  Future<Result<FoodItem, Exception>> get(int id) async {
    try {
      final data = foodItemBox.get(id);
      if (data == null) throw Exception("Unable to find entity with corresponding id");
      return Result.success(data.toDomain());
    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }
  
  @override
  Future<Result<List<FoodItem>, Exception>> filteredSearch(FoodItemFilter filter) async {
    try {
      Condition<FoodItemEntity>? mainCondition = filter.toObjectBoxCondition();

      if (filter.excludeAllergies != null && filter.excludeAllergies!.isNotEmpty) {
        
        Condition<FoodItemEntity>? allergyCondition;
        
        for (final allergy in filter.excludeAllergies!) {
          final c = FoodItemEntity_.allergies.containsElement(allergy);
          allergyCondition = allergyCondition == null ? c : allergyCondition.or(c);
        }

        if (allergyCondition != null) {
          final unsafeQuery = foodItemBox.query(allergyCondition).build();
          final unsafeIds = unsafeQuery.findIds();
          unsafeQuery.close();

          if (unsafeIds.isNotEmpty) {
            final excludeCondition = FoodItemEntity_.id.notOneOf(unsafeIds);
            mainCondition = mainCondition == null 
                ? excludeCondition 
                : mainCondition.and(excludeCondition);
          }
        }
      }
      
      final queryBuilder = mainCondition == null 
          ? foodItemBox.query() 
          : foodItemBox.query(mainCondition);
      
      final query = queryBuilder.build();

      query.offset = filter.offset;
      query.limit = filter.limit;

      final List<FoodItemEntity> entities = query.find();
      query.close();
      
      final List<FoodItem> domainItems = entities.map((e) => e.toDomain()).toList();

      return Result.success(domainItems);
    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }
}