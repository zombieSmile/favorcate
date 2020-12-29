import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperationItem extends StatelessWidget {
  OperationItem({
    Key key,
    this.icon,
    this.title,
    this.textColor = Colors.black,
  }) : super(key: key);

  final Widget icon;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          icon,
          SizedBox(width: 3.w),
          Text(title, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
