import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  late Product product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.network(
                'https://dummyimage.com/600x400/bcf/fff&text=Product',
                height: 130.0,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            Text(product.productName),
            Text(
              product.unitPrice.toString(),
              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
