import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/screens/main_screen.dart';

void main() => runApp(GroceryApp());
//There will be no data management here, so we will define it as stateless.

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen());
  }
}
