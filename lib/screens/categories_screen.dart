import 'dart:ui';
import '../widgets/category_item.dart';

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        child: GridView(
          padding: EdgeInsets.all(5.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),

          children: DUMMY_CATEGORIES.map((meal){
            return CategoryItem(meal.id, meal.title, meal.color);
          }).toList(),
        ),
      ),
    );
  }
}















//import 'package:flutter/material.dart';
//import '../dummy_data.dart';
//import '../widgets//category_item.dart';
//
//class CategoryScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return GridView(
//      padding: EdgeInsets.all(15.0),
//      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//        maxCrossAxisExtent: 200,
//        mainAxisSpacing: 20,
//        crossAxisSpacing: 20,
//        childAspectRatio: 3/2,
//      ),
//
//       children: DUMMY_CATEGORIES.map((data){
//         return CategoryItem(data.id, data.title, data.color);
//       }).toList(),
//    );
//  }
//}
