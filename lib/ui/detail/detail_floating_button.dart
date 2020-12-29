import 'package:favorcate/model/meal.dart';
import 'package:favorcate/viewmodel/favor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailFloatingButton extends StatelessWidget {
  const DetailFloatingButton({
    Key key,
    @required this.mealModel,
  }) : super(key: key);

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    FavorViewModel favorViewModel = context.watch<FavorViewModel>();
    final iconData = favorViewModel.isFavor(mealModel)
        ? Icons.favorite
        : Icons.favorite_border;
    final iconColor =
        favorViewModel.isFavor(mealModel) ? Colors.red : Colors.black;
    return FloatingActionButton(
      backgroundColor: Colors.amber,
      onPressed: () {
        favorViewModel.handleMeal(mealModel);
      },
      child: Icon(iconData, color: iconColor),
    );
  }
}
