import 'dart:convert';
import 'package:favorcate/model/category.dart';
import 'package:flutter/services.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryData() async {
    final jsonString = await rootBundle.loadString('assets/json/category.json');
    final result = json.decode(jsonString);
    final resultList = result['category'];
    List<CategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(CategoryModel.fromJson(json));
    }
    return categories;
  }
}
