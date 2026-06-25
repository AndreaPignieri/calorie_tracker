final class FoodItemFilter {
  final String? barcode;
  
  final String? name;
  final String? brand;

  final double? maxCaloriesPer100g;
  final double? maxCarbsPer100g;
  final double? maxProteinPer100g;
  final double? maxFatsPer100g;
  final double? maxFiberPer100g;

  final double? minCaloriesPer100g;
  final double? minCarbsPer100g;
  final double? minProteinPer100g;
  final double? minFatsPer100g;
  final double? minFiberPer100g;


  final double? maxServingSizeWeight;
  final double? minServingSizeWeight;

  final String? servingSizeName;

  final List<String>? excludeAllergies;

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
    this.maxServingSizeWeight,
    this.minServingSizeWeight,

    this.excludeAllergies,
  });
}