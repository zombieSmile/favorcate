import 'package:favorcate/ui/favor/favor_content.dart';
import 'package:flutter/material.dart';

class FavorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: FavorContent(),
    );
  }
}
