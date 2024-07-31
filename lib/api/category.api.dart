import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_flutter_1/model/category.dart';

class CategoryApi{
  static Future<List<MealCategory>> getMealCategory() async {
    // var uri = Uri.https("www.themealdb.com","/api/json/v1/1/list.php",{
    //   "c" : "list"
    // });

    final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));

  Map data = jsonDecode(response.body);
  List _temp = [];

  for (var i in data['categories']) {
    //print(i);
    _temp.add(i);
  }

  return MealCategory.mealCategoryFromSnapshot(_temp);

  }
}