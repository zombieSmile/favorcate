import 'package:favorcate/model/meal.dart';
import 'package:favorcate/ui/meal/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final cardRadius = 12.w;

class MealItem extends StatelessWidget {
  const MealItem({
    Key key,
    @required this.mealModel,
  }) : super(key: key);

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.w),
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius)),
      child: Column(
        children: [
          buildBasicInfo(),
          buildOperationInfo(),
        ],
      ),
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

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
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
          OperationItem(
            icon: Icon(Icons.favorite),
            title: '未收藏',
          ),
        ],
      ),
    );
  }
}
