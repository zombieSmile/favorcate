import 'package:favorcate/viewmodel/fliter_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(),
        buildListView(context),
      ],
    );
  }

  Widget buildTitle() {
    return Container(
      padding: EdgeInsets.all(20.w),
      alignment: Alignment.center,
      child: Text('展示你的选择', style: TextStyle(fontSize: 20.sp)),
    );
  }

  Widget buildListView(BuildContext context) {
    FilterViewModel filterViewModel = context.watch<FilterViewModel>();
    return Expanded(
      child: ListView(
        children: [
          buildListTile(
            '无谷蛋白',
            '展示无谷蛋白食物',
            filterViewModel.isGlutenFree,
            (value) {
              filterViewModel.isGlutenFree = value;
            },
          ),
          buildListTile(
            '不含乳糖',
            '展示不含乳糖食物',
            filterViewModel.isLactoseFree,
            (value) {
              filterViewModel.isLactoseFree = value;
            },
          ),
          buildListTile(
            '素食主义',
            '展示普通素食相关食物',
            filterViewModel.isVegetarian,
            (value) {
              filterViewModel.isVegetarian = value;
            },
          ),
          buildListTile(
            '严格素食主义',
            '展示严格素食主义相关食物',
            filterViewModel.isVegan,
            (value) {
              filterViewModel.isVegan = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
    String title,
    String subtitle,
    bool value,
    Function onChange,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: CupertinoSwitch(value: value, onChanged: onChange),
    );
  }
}
