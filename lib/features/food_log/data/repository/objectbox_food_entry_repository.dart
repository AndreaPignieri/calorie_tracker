import 'package:calorie_tracker/features/food_log/domain/repository/i_food_entry_repository.dart';
import 'package:calorie_tracker/features/food_log/data/mappers/food_log_mappers.dart';
import 'package:calorie_tracker/features/food_log/data/local/food_entry_entity.dart';
import 'package:calorie_tracker/features/food_log/domain/model/food_entry.dart';
import 'package:calorie_tracker/features/food_log/domain/model/log_date.dart';
import 'package:calorie_tracker/core/utils/result.dart';
import 'package:calorie_tracker/objectbox.g.dart';


class ObjectboxFoodEntryRepository implements IFoodEntryRepository {
  final Box<FoodEntryEntity> foodEntryBox;

  ObjectboxFoodEntryRepository({required this.foodEntryBox});
  
  @override
  Future<Result<FoodEntry, Exception>> create(FoodEntry foodEntry) async {
    try {
      final entity = foodEntry.toEntity();
      final newId = foodEntryBox.put(entity);
      final savedEntity = foodEntryBox.get(newId);
      
      if (savedEntity == null) throw Exception('Read error after creation');
      
      final savedDomainModel = savedEntity.toDomain();
      return Result.success(savedDomainModel);
    
    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }

  @override
  Future<Result<FoodEntry, Exception>> getById(int id) async {
    try {
      final data = foodEntryBox.get(id);
      
      if (data==null) throw Exception("Unable to find entity with corresponding id");

      return Result.success(data.toDomain());
    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }

  @override
  Future<Result<List<FoodEntry>, Exception>> getByDate(LogDate logDate) async {
    try{
      final query = foodEntryBox.query(FoodEntryEntity_.dateTime.equalsDate(DateTime.utc(logDate.year, logDate.month, logDate.day))).build();
      final List<FoodEntryEntity> foodEntryEntityList = query.find();
      query.close();

      List<FoodEntry> data = foodEntryEntityList.map((entity) => entity.toDomain()).toList();

      return Result.success(data);

    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }
  @override
  Future<Result<FoodEntry, Exception>> update(FoodEntry foodEntry) async {
    try{
      final entity = foodEntry.toEntity();
      final newId = foodEntryBox.put(entity);
      final updatedEntity = foodEntryBox.get(newId);

      if (updatedEntity==null) throw Exception("Read error after update");

      return Result.success(updatedEntity.toDomain());

    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }
  @override
  Future<Result<void, Exception>> delete(int id) async {
    try{
      final result = foodEntryBox.remove(id);

      if (result) {
        return Result.success(null);
      } else {
        throw Exception("Failed to delete data");
      }

    } catch (e) {
      return Result.failure(Exception('DB error: $e'));
    }
  }
}
