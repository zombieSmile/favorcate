import 'package:favorcate/model/meal.dart';
import 'package:favorcate/ui/detail/detail.dart';
import 'package:favorcate/viewmodel/favor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'operation_item.dart';

final cardRadius = 12.w;

class MealItem extends StatelessWidget {
  const MealItem({
    Key key,
    @required this.mealModel,
  }) : super(key: key);

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.w),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: [
            buildBasicInfo(),
            buildOperationInfo(context),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: mealModel);
      },
    );
  }

  Widget buildBasicInfo() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          ),
          child: Image.network(
            mealModel.imageUrl,
            width: double.infinity,
            height: 250.w,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10.w,
          bottom: 10.h,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.w),
            ),
            child: Text(
              mealModel.title,
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOperationInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OperationItem(
          icon: Icon(Icons.schedule),
          title: '${mealModel.duration}分钟',
        ),
        OperationItem(
          icon: Icon(Icons.restaurant),
          title: '${mealModel.complexStr}',
        ),
        buildFavorItem(context),
      ],
    );
  }

  Widget buildFavorItem(BuildContext context) {
    FavorViewModel favorViewModel = context.watch<FavorViewModel>();
    final iconData = favorViewModel.isFavor(mealModel)
        ? Icons.favorite
        : Icons.favorite_border;
    final favorColor =
        favorViewModel.isFavor(mealModel) ? Colors.red : Colors.black;
    final title = favorViewModel.isFavor(mealModel) ? "收藏" : "未收藏";
    return GestureDetector(
      child: OperationItem(
        icon: Icon(iconData, color: favorColor),
        title: title,
        textColor: favorColor,
      ),
      onTap: () {
        favorViewModel.handleMeal(mealModel);
      },
    );
  }
}
