

import 'package:belajar_flutter_1/api/search_meal.api.dart';
import 'package:belajar_flutter_1/views/widgets/category_card.dart';
import 'package:belajar_flutter_1/views/widgets/detail_category_card.dart';
import 'package:flutter/material.dart';


import '../model/search_meal.dart';

class SearchPage extends StatefulWidget
{
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
{
  final TextEditingController strMealController = TextEditingController();

  late List<SearchMeal> _searchdata = [];

  bool _isLoading = false;

  Future<void> showSearchResult(String strMealName) async
  { 
    _isLoading = true;
    _searchdata = await SearchMealApi.searchMealbyName(strMealName);
    setState(() {
      _searchdata = _searchdata;
      _isLoading = false;
    });
  }

  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Cari', style: TextStyle(fontSize: 20, color: Colors.black),),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: (){

            },
          ),
        ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children:[
              const SizedBox(height: 20),
              SearchBar(
                  controller: strMealController,
                  onChanged: (String value) {
                    showSearchResult(value);
                  },
                  leading: const Icon(Icons.search),
                  hintText: 'Nama makanan',
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
                ),
              const SizedBox(height: 20),
              Expanded(
                child: _searchdata.isEmpty ? 
                const Center(
                  child: Text("Silahkan masukkan kata kunci"),
                  )
                : GridView.builder(
                  
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 150,
                  ),
                  itemCount: _searchdata.length,
                  itemBuilder: (context, index) => DetailCategoryCard(
                    strMeal: _searchdata[index].strMeal, 
                    strMealThumb: _searchdata[index].strMealThumb, 
                    idMeal: _searchdata[index].idMeal)
                ),
              ),
              
              
            ],
          ),
        )
      );
  }
}