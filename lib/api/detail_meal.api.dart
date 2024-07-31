import 'dart:convert';

import 'package:belajar_flutter_1/model/detail_meal.dart';
import 'package:http/http.dart' as http;
class DetailMealApi
{

  final String strMealName;

  DetailMealApi({ 
    required this.strMealName,
  });


    static Future<DetailMeal> fetchMeal(String strMeal) async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$strMeal'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return DetailMeal.fromJson(jsonResponse['meals'][0]);
    } else {
      throw Exception('Failed to load meal');
    }
  }
  // static Future<List<DetailMeal>> getDetailMeal(String strIdMeal) async
  // {
  //   final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s=$strIdMeal"));

  //   Map data= jsonDecode(response.body);
  //   List _temp = [];

  //   for(var i in data['meals'])
  //   {
  //     _temp.add(i);
  //   }

  //   return DetailMeal.detailMealFromSnapshot(_temp);
  // }
}