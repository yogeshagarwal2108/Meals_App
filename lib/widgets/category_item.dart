import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.redAccent,
      onTap: ()=> Navigator.of(context).pushNamed("/category-meals", arguments: {
        "id": id,
        'title': title,
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.3),
              color.withOpacity(0.7),
              color.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          borderRadius: BorderRadius.circular(15),
        ),

        child:  Text(title, style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
}















//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//class CategoryItem extends StatelessWidget {
//
//  final String id;
//  final String title;
//  final Color color;
//
//  CategoryItem(this.id, this.title, this.color);
//
//  @override
//  Widget build(BuildContext context) {
//    return InkWell(
//      onTap: (){
//        Navigator.of(context).pushNamed("/category-meals", arguments: {
//          "id": id,
//          "title": title,
//        });
//      },
//      splashColor: Theme.of(context).primaryColor,
//      borderRadius: BorderRadius.circular(10.0),
//      child: Container(
//        padding: EdgeInsets.all(15.0),
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(10.0),
//          gradient: LinearGradient(
//            colors: [
//              color.withOpacity(0.7),
//              color,
//            ],
//            begin: Alignment.topLeft,
//            end: Alignment.bottomRight,
//          ),
//        ),
//
//        child: Text(title, style: Theme.of(context).textTheme.headline6,),
//      ),
//    );
//  }
//}
