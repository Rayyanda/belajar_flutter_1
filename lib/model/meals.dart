class Meals {
  String strMeal;


  Meals({
    required this.strMeal,
  });

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
    strMeal: json['strMeal'],
  );

}
