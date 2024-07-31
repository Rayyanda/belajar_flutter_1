import 'package:belajar_flutter_1/data/favorite_meal_local.dart';
import 'package:flutter/material.dart';

import '../model/favorite.dart';
import 'widgets/detail_category_card.dart';

class FavoriteMealPage extends StatefulWidget
{
  const FavoriteMealPage({
    super.key
  });

  @override
  _FavoriteMealPageState createState() => _FavoriteMealPageState();
}

class _FavoriteMealPageState extends State<FavoriteMealPage>
{
  @override
  void initState()
  {
    super.initState();
    getFavoriteMeals();
  }
  late List<Favorite> _favoritMeals = [];
  //bool _isLoading = true;

  Future<void> getFavoriteMeals() async
  {
    final result = await FavoriteMealLocal.instance.getFavorite();
    setState(() {
      //_isLoading = false;
      _favoritMeals = result;

    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Meals'),
      ),
      body: _favoritMeals.isEmpty ? const Center(child: Text("Anda belum menambahkan daftar favorit"))
          : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: _favoritMeals.length,
        itemBuilder: (context, index) => DetailCategoryCard(

          strMeal: _favoritMeals[index].strMeal,
          strMealThumb: _favoritMeals[index].strMealThumb,
          idMeal: _favoritMeals[index].idMeal,
        ),
      )
    );
  }
}