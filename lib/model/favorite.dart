import 'dart:convert';

class Favorite
{
  final int? id;
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  Favorite({
    this.id,
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  Map<String, dynamic> toMap()
  {
    return {
      'id': id,
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map)
  {
    return Favorite(
      id: map['id']?.toInt(),
      idMeal: map['idMeal'],
      strMeal: map['strMeal'],
      strMealThumb: map['strMealThumb'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source)=>
    Favorite.fromMap(json.decode(source));
  
  Favorite copyWith({
    int? id,
    String? idMeal,
    String? strMeal,
    String? strMealThumb,
  }){
    return Favorite(
      id: id ?? this.id,
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
    );
  }
}