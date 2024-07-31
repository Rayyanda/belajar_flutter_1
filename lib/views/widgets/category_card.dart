import 'package:belajar_flutter_1/views/detail_category_page.dart';
import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget{


  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;


  const CardCategory({
    super.key,
    required  this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription
  });
  
  @override
 Widget build(BuildContext context){
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailCategoryPage(strCategory: strCategory, strCategoryDescription: strCategoryDescription);
            }));
            debugPrint(strCategory);
          },
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white10,
                      spreadRadius: -5.0,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0,
                    )
                  ],
                  image: DecorationImage(
                    image: NetworkImage(strCategoryThumb),
                    //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.multiply),
                    fit: BoxFit.cover
                  )
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                        child: Text(strCategory, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    )
    );
  }
}