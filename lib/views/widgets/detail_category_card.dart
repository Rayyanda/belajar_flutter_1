import 'package:belajar_flutter_1/views/detail_meal_page.dart';
import 'package:flutter/material.dart';

class DetailCategoryCard extends StatelessWidget
{

  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  const DetailCategoryCard({
    super.key,

    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal
  });

  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailMealPage(strMeal: strMeal, idMeal: idMeal);
            }));
            debugPrint(strMeal);
          },
          child: SizedBox(
                width: 150,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white10,
                          spreadRadius: -5.0,
                          offset: Offset(0.0,20.0),
                          blurRadius: 10.0,
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(strMealThumb),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(strMeal, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                          )
                        )
                      ]
                    )
                    
                  ),
                ),
              ),
        ),
      ),
    );
  }
}