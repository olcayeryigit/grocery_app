import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/data/api/category_api.dart';
import 'package:grocery_app_flutter/data/api/product_api.dart';
import 'package:grocery_app_flutter/models/category.dart';
import 'package:grocery_app_flutter/models/product.dart';
import 'package:grocery_app_flutter/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = [];
  List<Widget> categoryWidgets = [];
  List<Product> products = [];
  //I will fetch the categories from the API here.
  @override
  void initState() {
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery App", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              /*horizantal scroll*/
              child: Row(children: categoryWidgets),
            ),

            //The product list widget that displays the products belonging to the selected category
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }

  //I will fetch the data from the API and map it to our categories list.
  /*Normally, to use a class, we need to create an instance of it using new (or just calling the constructor, like User()). This allows us to access its non-static properties and methods.

However, when a method or property is marked as static, we don’t need to instantiate the class. Instead, we can access the static member directly through the class name. */
  /*Normal class (non-static):
Each time you call it with new, a new instance (object) is created. This means multiple separate objects can exist in memory.

Static structure:
Static members are created only once in memory. No matter how many times you access them, they always come from the same place. A new instance is not created. */
  /*

If a class doesn't store any data (i.e., it has no state), and is only used to perform operations — like calculations, conversions, or formatting — then it's a good idea to make its methods static.

That way, you don’t need to create an instance every time you want to use it. It saves memory and makes your code cleaner and more efficient.
 */
  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      //print("Raw JSON: ${response.body}");
      /*In Flutter, when you want to update the data of a widget and reflect that change on the screen, you use setState. */
      setState(() {
        /*"API responses usually come in JSON format as a String. To convert this data into Dart objects (classes), JSON mapping is performed." */
        /*We convert the JSON data received from the API into a usable collection (Iterable) format in Dart. */
        /*
        Iterable is the superclass of collection types such as List and Set.

A data structure of the Iterable type is commonly used to iterate over the elements of collections.

Collections like List and Set in Dart also implement Iterable, meaning these collections can use Iterable. */
        Iterable list = json.decode(response.body);
        /*
        The map() function does not modify the original collection but applies the specified transformation function to each element and returns a new collection (Iterable). This operation transforms each element of the collection to create a new one. For example, (category) => Category.
        
        fromJson(category) is the transformation function applied to each category element within the map() function. Here, category represents each element in the list collection. The Category.fromJson(category) function calls the fromJson() function of the Category class on the category item and converts it into a Category object.

The toList() function is used because map() returns an Iterable, so we convert the resulting temporary collection into a List using toList(). As a result, the Iterable collection obtained by map() is converted into a List format and takes its final form.
         */
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();

        getCategoryWidgets();
      });
      /*I will loop through each category individually and make each of them a TextButton Widget
 */
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
      //print(categories[i].name);
    }
    return categoryWidgets;
    //For each item in the categories list, a button widget is created and added to the categoryWidgets list, and this list is then returned.
  }

  Widget getCategoryWidget(Category category) {
    return TextButton(
      //The process of displaying the products related to a category when that category is clicked.
      //For this, we need to define a product list at the top.
      onPressed: () {
        //print(category.name);
        getProductsByCategoryId(category);
      },

      child: Text(category.name, style: TextStyle(color: Colors.red)),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.black12),
        ),
      ),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      // Why is State Management Done in the Parent Widget?
      //The constructors of child widgets do not run again; only their build() method is called.
      //Therefore, even if you add state to a child widget, that state can be unprotected or may miss updates.
      //If the state is held in the parent widget (such as a StatefulWidget), data is passed down to child widgets (like props), and user interactions can be managed using setState() in the parent.
      /*This approach is:
Safer
More manageable
Better in terms of performance*/

      /* 
✅ build() Method Runs Again
The build() method defines how the widget should appear on the screen.

When setState() is called, build() is triggered again and the UI is updated.

❌ constructor Does Not Run Again
The constructor only runs when the widget is created for the first time.

In other words, it runs once when the widget is first added to the screen (before initState), and it does not run again when setState() is called.
*/
      setState(() {
        Iterable list = json.decode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
