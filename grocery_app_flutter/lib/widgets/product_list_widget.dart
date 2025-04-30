import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/models/product.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products = [];
  ProductListWidget(List<Product> products) {
    this.products = products;
  }

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        /*✅ Using State<ProductListWidget> gives access to the widget instance, so you can use widget.products to access its properties.
      
      ❌ If you just use State without a generic type, you cannot access the specific widget’s fields like products.
      
       */
        //This structure is used in Flutter to establish the connection between the StatefulWidget and its corresponding widget.
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          //print(widget.products[index].productName);
          return Text(widget.products[index].productName);
        },
      ),
    );
  }
}
