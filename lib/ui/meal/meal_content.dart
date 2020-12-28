import 'package:favorcate/model/category.dart';
import 'package:favorcate/model/meal.dart';
import 'package:favorcate/ui/meal/meal_item.dart';
import 'package:favorcate/viewmodel/meal_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Selector<MealViewModel, List<MealModel>>(
      builder: (context, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItem(mealModel: meals[index]);
          },
        );
      },
      selector: (context, mealViewModel) => mealViewModel.meals
          .where((element) => element.categories.contains(category.id))
          .toList(),
      shouldRebuild: (prev, next) => !listEquals(prev, next),
    );
  }
}
