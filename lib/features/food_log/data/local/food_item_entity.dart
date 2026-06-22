import 'package:objectbox/objectbox.dart';

@Entity()
class FoodItemEntity {
  @Id()
  int id = 0;

  @Index()
  String? barcode;
  
  String name = "";
  String? brand;

  double caloriesPer100g = 0;
  double carbsPer100g = 0;
  double proteinPer100g = 0;
  double fatsPer100g = 0;
  double fiberPer100g = 0;

  double servingSizeWeight = 0;
  String? servingSizeName;

  List<String>? allergies;
}