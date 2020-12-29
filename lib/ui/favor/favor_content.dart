import 'package:favorcate/ui/meal/meal_item.dart';
import 'package:favorcate/viewmodel/favor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavorViewModel favorViewModel = context.watch<FavorViewModel>();
    if (favorViewModel.favorMeals.isEmpty) {
      return Center(
        child: Text(
          '未收藏美食',
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ),
      );
    }
    return ListView.builder(
      itemCount: favorViewModel.favorMeals.length,
      itemBuilder: (context, index) {
        return MealItem(mealModel: favorViewModel.favorMeals[index]);
      },
    );
  }
}
