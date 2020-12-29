import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.w,
      child: Drawer(
        child: Column(
          children: [
            buildHeaderView(),
            buildListTile(Icons.restaurant, '进餐', () {
              Navigator.of(context).pop();
            }),
            buildListTile(Icons.settings, '过滤', () {}),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderView() {
    return Container(
      width: double.infinity,
      height: 120.h,
      color: Colors.orangeAccent,
      alignment: Alignment(0.0, 0.15),
      child: Text(
        '开始动手',
        style: TextStyle(fontSize: 20.sp, color: Colors.black87),
      ),
    );
  }

  Widget buildListTile(IconData iconData, String title, Function onTap) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(fontSize: 20.sp, color: Colors.black54),
      ),
      onTap: onTap,
    );
  }
}
