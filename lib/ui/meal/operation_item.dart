import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperationItem extends StatelessWidget {
  OperationItem({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 3.w),
        Text(title),
      ],
    );
  }
}
