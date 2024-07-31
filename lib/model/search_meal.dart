class SearchMeal
{
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  SearchMeal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb
  });

 factory SearchMeal.fromJson(dynamic json)
 {
  return SearchMeal(
    idMeal: json['idMeal'] as String,
    strMeal: json['strMeal'] as String,
    strMealThumb: json['strMealThumb'] as String
  );
 }

 static List<SearchMeal> searchMealFromSnapshot(List snapshot)
 {
  return snapshot.map((data){
    return SearchMeal.fromJson(data);
  }).toList();
 }

 @override
 String toString() 
 {
  return 'SearchMeal : {idMeal: $idMeal, strMeal: $strMeal, strMealThumb: $strMealThumb}';
 }
}