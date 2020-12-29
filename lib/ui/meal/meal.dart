import 'package:favorcate/model/category.dart';
import 'package:flutter/material.dart';
import 'meal_content.dart';

class MealPage extends StatelessWidget {
  static const String routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: MealContent(),
    );
  }
}
