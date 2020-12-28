import 'package:favorcate/ui/home/home_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食"),
      ),
      body: HomeContent(),
    );
  }
}
