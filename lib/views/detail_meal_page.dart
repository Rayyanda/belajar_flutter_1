import 'dart:async';


import 'package:belajar_flutter_1/api/detail_meal.api.dart';
import 'package:belajar_flutter_1/data/favorite_meal_local.dart';
import 'package:belajar_flutter_1/model/detail_meal.dart';
import 'package:belajar_flutter_1/model/favorite.dart';
import 'package:flutter/material.dart';

class DetailMealPage extends StatefulWidget
{
  final String strMeal;
  final String idMeal;

  const DetailMealPage({
    super.key,
    required this.strMeal,
    required this.idMeal
  });

  @override
  _DetailMealPageState createState() => _DetailMealPageState();
}

class _DetailMealPageState extends State<DetailMealPage>
{
  late Future<DetailMeal> _detailMeal;
  //bool _isLoading = true;  
  late bool _isFavorite;
  @override
  void initState()
  {
    super.initState();
    getDataMeal(widget.strMeal, widget.idMeal);
    checkFavorite(widget.idMeal);
  }

  Future<void> checkFavorite(String idMeal) async
  {
    final favorite = await FavoriteMealLocal.instance.checkFavorite(idMeal);
    debugPrint(favorite.toString());
    setState(() {
      _isFavorite = favorite;
    });
    
  }

  Future<void> getDataMeal(String strMealName, String idMeal) async 
  {
    //final dbHelper = FavoriteMealLocal.instance;
    _detailMeal = DetailMealApi.fetchMeal(strMealName);
    //_isFavorite = FavoriteMealLocal.instance.checkFavorite(idMeal);
    //debugPrint(_isFavorite.toString());
    setState(() {
      //_isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(widget.strMeal),
      ),
      body: FutureBuilder<DetailMeal>(
        future: _detailMeal,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final meal = snapshot.data!;
            // final int isFavorite = await FavoriteMealLocal.instance.checkFavorite(meal.idMeal);
            return Padding(
              
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image(
                    image: NetworkImage(meal.strMealThumb),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    meal.strMeal,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text('Category: ${meal.strCategory}'),
                  Text('Area: ${meal.strArea}'),
                  const SizedBox(height: 8.0),
                  const Text('Instructions:'),
                  Text(meal.strInstructions),
                  const SizedBox(height: 8.0),
                  const Text('Ingredients:'),
                  for (int i = 0; i < meal.strIngredients.length; i++)
                    Text('${meal.strIngredients[i]} - ${meal.strMeasure[i]}'),
                  const SizedBox(height: 8.0),
                  if (meal.strTags != "")
                    Text('Tags: ${meal.strTags}'),
                  const SizedBox(height: 8.0),
                  if (meal.strYoutube != "")
                    Text('Youtube: ${meal.strYoutube}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if( _isFavorite == true )
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white
                          ),
                          icon: const Icon(Icons.favorite_border),
                          onPressed: (){
                            //menambah ke favorite
                            FavoriteMealLocal.instance.addToFavorite(
                              Favorite(
                                idMeal: meal.idMeal,
                                strMeal: meal.strMeal,
                                strMealThumb: meal.strMealThumb
                              )
                            );
                            checkFavorite(meal.idMeal);
                            //debugPrint(meal.idMeal);
                          },
                          label: const Text("Add to Favorite"),

                        ),
                      if( _isFavorite == false)
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white
                          ),
                          icon: const Icon(Icons.favorite),
                          onPressed: (){
                            FavoriteMealLocal.instance.deleteFavorite(meal.idMeal);
                            checkFavorite(meal.idMeal);
                          },
                        )

                    ],
                  ),
                  

                ],
              ),
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.share),
        onPressed: () {

        }
      ),
    );
  }

}