class FoodItem {
  int id;

  String? barcode;
  
  String name;
  String? brand;

  double caloriesPer100g;
  double carbsPer100g;
  double proteinPer100g;
  double fatsPer100g;
  double fiberPer100g;

  double servingSizeWeight;
  String? servingSizeName;

  List<String>? allergies;

  FoodItem({
    required this.id,
    required this.barcode,
    required this.name,
    required this.brand,
    required this.caloriesPer100g,
    required this.carbsPer100g,
    required this.proteinPer100g,
    required this.fatsPer100g,
    required this.fiberPer100g,
    required this.servingSizeWeight,
    servingSizeName,
    allergies
  });


}