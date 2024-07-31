import 'package:belajar_flutter_1/api/detail_category.api.dart';
import 'package:belajar_flutter_1/views/widgets/detail_category_card.dart';
import 'package:flutter/material.dart';

import '../model/detail_category.dart';

class DetailCategoryPage extends StatefulWidget{
  final String strCategory;
  final String strCategoryDescription;
 const DetailCategoryPage({
    super.key,
    required this.strCategory,
    required this.strCategoryDescription,
  });

  @override
  _DetailCategoryPageState createState() => _DetailCategoryPageState();
}

class _DetailCategoryPageState extends State<DetailCategoryPage>
{

  @override
  void initState()
  {
    super.initState();
    getDetailCategory(widget.strCategory);
  }

  late List<DetailCategory> _detailCategory;
  bool _isLoading = true;

  Future<void> getDetailCategory(String strCategory)
  async {
    _detailCategory = await DetailCategoryApi.getDetailCategory(strCategory);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(widget.strCategory),
      ),
      body: _isLoading ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
            children: [
               Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Text(widget.strCategoryDescription, style: const TextStyle(fontSize: 12),),
                ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    ),
                    itemCount: _detailCategory.length,
                    itemBuilder: (context, index) => DetailCategoryCard(

                      strMeal: _detailCategory[index].strMeal,
                      strMealThumb: _detailCategory[index].strMealThumb,
                      idMeal: _detailCategory[index].idMeal,
                  ),
                ),
              )
            ],
          ),
      );
          
  }
}