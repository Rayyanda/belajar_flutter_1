import 'dart:convert';

import 'package:belajar_flutter_1/model/detail_category.dart';
import 'package:http/http.dart' as http;

class DetailCategoryApi
{
  final String strCategory;

  DetailCategoryApi({
    required this.strCategory
  });


  static Future<List<DetailCategory>> getDetailCategory(String strCategoryName) async 
  {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$strCategoryName'));

    Map data = jsonDecode(response.body);
    List _temp = [];

    for(var i in data['meals'])
    {
      _temp.add(i);
    }

    return DetailCategory.detailCategoryFromSnapshot(_temp);
  }
}