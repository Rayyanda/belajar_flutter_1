class DetailCategory
{
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  DetailCategory({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory DetailCategory.fromJson(dynamic json)
  {
    return DetailCategory(
      strMeal: json['strMeal'] as String,
      strMealThumb: json['strMealThumb'] as String,
      idMeal: json['idMeal'] as String,
    );
  }

  static List<DetailCategory> detailCategoryFromSnapshot(List snapshot)
  {
    return snapshot.map((data){
      return DetailCategory.fromJson(data);
    }).toList();
  }

  @override
  String toString()
  {
    return 'DetailCategory : {idMeal : $idMeal, strMeal: $strMeal, strMealThumb: $strMealThumb}';
  }
}