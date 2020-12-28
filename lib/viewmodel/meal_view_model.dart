import 'package:favorcate/model/meal.dart';
import 'package:favorcate/services/meal_request.dart';
import 'package:flutter/material.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  List<MealModel> get meals {
    return _meals;
  }

  MealViewModel() {
    MealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
