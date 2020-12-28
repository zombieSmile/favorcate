import 'package:favorcate/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key key,
    @required this.mealModel,
  }) : super(key: key);

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildImage(),
          buildTitle('制作材料'),
          buildMaterial(),
          buildTitle('制作步骤'),
          buildSteps(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Container(
      width: double.infinity,
      child: Image.network(mealModel.imageUrl),
    );
  }

  Widget buildTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.w),
      child: Text(
        title,
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildMaterial() {
    return buildContent(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: mealModel.ingredients.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(mealModel.ingredients[index]),
            ),
          );
        },
      ),
    );
  }

  Widget buildSteps() {
    return buildContent(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('#${index + 1}'),
            ),
            title: Text(mealModel.steps[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: mealModel.steps.length,
      ),
    );
  }

  Widget buildContent({Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.w),
      ),
      width: ScreenUtil().screenWidth - 30.w,
      child: child,
    );
  }
}
