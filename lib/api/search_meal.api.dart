import 'dart:convert';

import 'package:belajar_flutter_1/model/search_meal.dart';
import 'package:http/http.dart' as http;
class SearchMealApi
{
  final String strMealName;

  SearchMealApi({
    required this.strMealName,
  });


  static Future<List<SearchMeal>> searchMealbyName(String strMealName)
  async {
    final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s=$strMealName"));

    Map data = jsonDecode(response.body);
    List _temp = [];

    for(var i in data['meals']){
      _temp.add(i);
    }

    return SearchMeal.searchMealFromSnapshot(_temp);
  }
}