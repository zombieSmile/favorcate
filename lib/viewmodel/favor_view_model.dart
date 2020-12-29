import 'package:favorcate/model/meal.dart';
import 'package:flutter/material.dart';

class FavorViewModel extends ChangeNotifier {
  List<MealModel> _favorMeals = [];

  List<MealModel> get favorMeals {
    return _favorMeals;
  }

  void addMeal(MealModel mealModel) {
    _favorMeals.add(mealModel);
    notifyListeners();
  }

  void removeMeal(MealModel mealModel) {
    _favorMeals.remove(mealModel);
    notifyListeners();
  }

  bool isFavor(MealModel mealModel) {
    return _favorMeals.contains(mealModel);
  }

  void handleMeal(MealModel mealModel) {
    if (isFavor(mealModel)) {
      removeMeal(mealModel);
    } else {
      addMeal(mealModel);
    }
  }
}
