final class FoodItemFilter {
  final String? barcode;
  
  final String? name;
  final String? brand;

  final int? maxCaloriesPer100g;
  final int? maxCarbsPer100g;
  final int? maxProteinPer100g;
  final int? maxFatsPer100g;
  final int? maxFiberPer100g;

  final int? minCaloriesPer100g;
  final int? minCarbsPer100g;
  final int? minProteinPer100g;
  final int? minFatsPer100g;
  final int? minFiberPer100g;


  final double? servingSizeWeight;
  final String? servingSizeName;

  final List<String>? excludeAllergies;

  final int limit;
  final int offset;

  FoodItemFilter({
    this.barcode,

    this.name,
    this.brand,

    this.maxCaloriesPer100g,
    this.maxCarbsPer100g,
    this.maxProteinPer100g,
    this.maxFatsPer100g,
    this.maxFiberPer100g,

    this.minCaloriesPer100g,
    this.minCarbsPer100g,
    this.minProteinPer100g,
    this.minFatsPer100g,
    this.minFiberPer100g,

    this.servingSizeName,
    this.servingSizeWeight,

    this.excludeAllergies,

    required this.limit,
    required this.offset
  });
}