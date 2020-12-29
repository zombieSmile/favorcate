import 'package:favorcate/model/meal.dart';
import 'package:favorcate/services/meal_request.dart';
import 'package:favorcate/viewmodel/fliter_view_model.dart';
import 'package:flutter/material.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  List<MealModel> get meals {
    return _meals.where((meal) {
      if (_filterViewModel.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterViewModel.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterViewModel.isVegetarian && !meal.isVegetarian) return false;
      if (_filterViewModel.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  FilterViewModel _filterViewModel;

  set filterViewModel(FilterViewModel value) {
    _filterViewModel = value;
  }

  MealViewModel() {
    MealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
