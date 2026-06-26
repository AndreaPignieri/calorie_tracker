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
    this.maxServingSizeWeight,
    this.minServingSizeWeight,

    this.excludeAllergies,

    required this.limit,
    required this.offset
  });

  bool isEmpty() {
    if (barcode != null && barcode!.isNotEmpty) return false;
    if (name != null && name!.isNotEmpty) return false;
    if (brand != null && brand!.isNotEmpty) return false;
    if (servingSizeName != null && servingSizeName!.isNotEmpty) return false;
    if (maxCaloriesPer100g != null) return false;
    if (maxCarbsPer100g != null) return false;
    if (maxProteinPer100g != null) return false;
    if (maxFatsPer100g != null) return false;
    if (maxFiberPer100g != null) return false;
    if (maxServingSizeWeight != null) return false;
    if (minCaloriesPer100g != null) return false;
    if (minCarbsPer100g != null) return false;
    if (minProteinPer100g != null) return false;
    if (minFatsPer100g != null) return false;
    if (minFiberPer100g != null) return false;
    if (minServingSizeWeight != null) return false;
    if (excludeAllergies != null && excludeAllergies!.isNotEmpty) return false;
    return true;
  }
}