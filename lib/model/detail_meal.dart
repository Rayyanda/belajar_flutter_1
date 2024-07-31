class DetailMeal
{
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strMealThumb;
  final String strInstructions;
  final String? strTags;
  final String? strYoutube;
  final List<String> strIngredients;
  final List<String> strMeasure;


  DetailMeal({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strMealThumb,
    required this.strInstructions,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredients,
    required this.strMeasure,
  });

  factory DetailMeal.fromJson(dynamic json)
  {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      if (json['strIngredient$i'] != null && json['strIngredient$i'] != '') {
        ingredients.add(json['strIngredient$i']);
      }
      if (json['strMeasure$i'] != null && json['strMeasure$i'] != '') {
        measures.add(json['strMeasure$i']);
      }
    }



    return DetailMeal(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strCategory: json['strCategory'] as String,
      strArea: json['strArea'] as String,
      strMealThumb: json['strMealThumb'] as String,
      strInstructions: json['strInstructions'] as String,
      strTags:  json['strTags'] as String?,
      strYoutube: json['strYoutube'] as String?,
      strIngredients: ingredients,
      strMeasure: measures,
    );
  }

  static List<DetailMeal> detailMealFromSnapshot(List snapshot)
  {
    return snapshot.map((data){
      return DetailMeal.fromJson(data);
    }).toList();
  }

  @override
  String toString()
  {
    return 'DetailMeal : {idMeal : $idMeal, strMeal: $strMeal, strCategory: $strCategory, strArea: $strArea, strMealThumb: $strMealThumb, strInstructions: $strInstructions, strTags: $strTags, strYoutube: $strYoutube}';
  }
}