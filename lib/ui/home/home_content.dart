import 'package:favorcate/model/category.dart';
import 'package:favorcate/services/json_parse.dart';
import 'package:favorcate/ui/home/home_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        final categories = snapshot.data;
        return GridView.builder(
          padding: EdgeInsets.all(20.w),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.w,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            CategoryModel categoryModel = categories[index];
            return HomeCategoryItem(categoryModel: categoryModel);
          },
        );
      },
    );
  }
}
