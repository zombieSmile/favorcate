import 'package:flutter/material.dart';
import '../home/home.dart';
import '../favor/favor.dart';

final List<Widget> pages = [HomePage(), FavorPage()];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
  BottomNavigationBarItem(label: '收藏', icon: Icon(Icons.star)),
];
