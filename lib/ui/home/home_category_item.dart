import 'package:favorcate/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    Key key,
    @required this.categoryModel,
  }) : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final bgColor = categoryModel.cColor;
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.w),
        gradient: LinearGradient(
          colors: [bgColor.withOpacity(.5), bgColor],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        categoryModel.title,
        style: TextStyle(
          fontSize: 20.sp,
          color: Colors.black87,
        ),
      ),
    );
  }
}
