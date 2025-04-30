class Product {
  int id; // mutable
  int categoryId; // mutable
  String productName; // mutable
  String quantityPerUnit; // mutable
  double unitPrice; // mutable
  int unitsInStock; // mutable
  //The reason I didn't use final is that the properties of Product need to be changeable when necessary.
  // Constructor
  /*required ensures that parameters are mandatory in the constructor. It is important for null safety and guarantees that each parameter gets a value, preventing object creation with missing data. */
  Product({
    required this.id,
    required this.categoryId,
    required this.productName,
    required this.quantityPerUnit,
    required this.unitPrice,
    required this.unitsInStock,
  });

  // Convert from JSON to Product object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      categoryId: json['categoryId'],
      productName: json['productName'],
      quantityPerUnit: json['quantityPerUnit'],
      //With this version, the unitPrice field is safely converted to a double regardless of whether it comes as an int, double, or string
      //First, we convert it to a string and then convert it to a double.
      unitPrice: double.parse(json['unitPrice'].toString()),
      unitsInStock: json['unitsInStock'],
    );
  }

  // Convert Product object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'productName': productName,
      'quantityPerUnit': quantityPerUnit,
      'unitPrice': unitPrice,
      'unitsInStock': unitsInStock,
    };
  }
}
