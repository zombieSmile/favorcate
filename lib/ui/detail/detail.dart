import 'package:favorcate/model/meal.dart';
import 'package:favorcate/ui/detail/detail_content.dart';
import 'package:favorcate/ui/detail/detail_floating_button.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = "/meal/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: DetailContent(mealModel: meal),
      floatingActionButton: DetailFloatingButton(mealModel: meal),
    );
  }
}
