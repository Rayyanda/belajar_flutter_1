import 'package:belajar_flutter_1/api/category.api.dart';
import 'package:belajar_flutter_1/model/category.dart';
import 'package:belajar_flutter_1/views/favorite_meal_page.dart';
import 'package:belajar_flutter_1/views/search_page.dart';
import 'package:belajar_flutter_1/views/widgets/category_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>
{

  @override
  void initState()
  {
    super.initState();
    getMealCategory();
  }

  late List<MealCategory> _mealCategory;
  bool _isLoading = true;

  Future<void> getMealCategory() async {
    _mealCategory = await CategoryApi.getMealCategory();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text("Meals")
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context){
              return const FavoriteMealPage();
            }));
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const SearchPage();
              }));
            },
          )
        ],
      ),
      body: _isLoading ? const Center(child: CircularProgressIndicator())
      : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
         
          ),
          itemCount: _mealCategory.length,
          itemBuilder: (BuildContext context, int index) => CardCategory(
          strCategory: _mealCategory[index].strCategory,
          strCategoryThumb: _mealCategory[index].strCategoryThumb,
          strCategoryDescription: _mealCategory[index].strCategoryDescription,
        )
      ),
      );
    
  }
 
}
