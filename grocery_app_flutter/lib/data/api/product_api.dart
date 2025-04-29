class ProductApi {
  /*In Dart, using a static structure within a class means accessing functions directly from the class itself instead of creating instances of the class. If you don't want to use the new keyword, you can use static methods instead. These methods can be called directly from the class without the need to create an instance of the class.*/
  static Future getProducts() {}

  static Future getProductsByCategoryId(int categoryId) {}
}
