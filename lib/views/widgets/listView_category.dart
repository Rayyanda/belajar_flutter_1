// import 'package:belajar_flutter_1/api/category.api.dart';
// import 'package:belajar_flutter_1/model/category.dart';
// import 'package:flutter/material.dart';

// class ListviewCategory extends StatelessWidget
// {
  
//   late List<MealCategory> _mealCategory;
//   late Function _onCategorySelected;

//   Future<void> getMealCategory() async {
//     _mealCategory = await CategoryApi.getMealCategory();
//   }
  


//   @override
//   Widget build(BuildContext context){
//     return ListView.builder(
//     padding: const EdgeInsets.all(8),
//     itemCount: _mealCategory.length,
//     itemBuilder: (BuildContext context, int index) {
//       return Container(
//         height: 50,
//         child: Center(child: Text('')),
//       );
//     }
//   );
//   }
// }