import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meals.dart';

class MealDetailScreen extends StatelessWidget {

  final Function toogleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toogleFavorite, this.isFavorite);

  buildItemList(child){
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(10),
      height: 180,
      width: 270,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: Colors.black),
      ),

      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {

    final String mealId= ModalRoute.of(context).settings.arguments as String;
    final Meal itemDetail= DUMMY_MEALS.firstWhere((meal){
      return meal.id== mealId;
    });

    buildHeading(String heading){
      return Container(
        padding: EdgeInsets.all(12),
        child: Text(heading, style: Theme.of(context).textTheme.headline6,),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(itemDetail.title, style: Theme.of(context).appBarTheme.textTheme.button,),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(itemDetail.imageUrl, fit: BoxFit.cover,),
            ),
            buildHeading("Ingredients"),

            buildItemList(
              ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: itemDetail.ingredients.length,
                itemBuilder: (context, i)=> Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(itemDetail.ingredients[i], style: TextStyle(fontWeight: FontWeight.w700,)),
                  ),
                ),
              ),
            ),

            buildHeading("Steps"),
            buildItemList(
              ListView.builder(
//                padding: EdgeInsets.all(8),
                itemCount: itemDetail.steps.length,
                itemBuilder: (context, i)=> Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text("# ${i+1}"),
                      ),
                      title: Text(itemDetail.steps[i]),
                    ),

                    Divider(height: 1.4,),
                  ],
                ),

              )
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        splashColor: Colors.redAccent,

        child: isFavorite(mealId) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        onPressed: (){
//          Navigator.of(context).pop(mealId);
          toogleFavorite(mealId);
        },
      ),
    );
  }
}















//import "package:flutter/material.dart";
//import '../dummy_data.dart';
////import 'dart:io';
//import '../models/meals.dart';
//import './favorites_screen.dart';
//
//class MealDetailScreen extends StatelessWidget {
//
////  final List<Meal> favoriteMeal;
//  final Function isFavorite;
//  final Function toogleFavorite;
//
//  MealDetailScreen(this.toogleFavorite, this.isFavorite);
//
//  @override
//  Widget build(BuildContext context) {
//    String mealId= ModalRoute.of(context).settings.arguments as String;
//
//    final selectedMeal= DUMMY_MEALS.firstWhere((meal){
//      return meal.id== mealId;
//    });
//
//    Widget buildHeading(text){
//      return Container(
//        padding: EdgeInsets.all(10),
//        child: Text(text, style: Theme.of(context).textTheme.headline6,),
//      );
//    }
//    Widget buildContent(child){
//      return Container(
//        height: 200,
//        width: 280,
//        padding: EdgeInsets.all(10.0),
////                margin: EdgeInsets.all(15.0),
//        decoration: BoxDecoration(
//        border: Border.all(color: Colors.black54),
//        borderRadius: BorderRadius.circular(15.0),
//        ),
//        child: child,
//      );
//    }
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(selectedMeal.title, style: Theme.of(context).appBarTheme.textTheme.headline5),
//      ),
//      body: SingleChildScrollView(
//        child: Container(
//          padding: EdgeInsets.all(7),
//          child: Column(
//            children: <Widget>[
//              Container(
//                width: double.infinity,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(15.0),
//                ),
//                child: Stack(
//                  children: <Widget>[
//                    ClipRRect(
//                      borderRadius: BorderRadius.circular(15.0),
//                      child: Image.network(selectedMeal.imageUrl, height: 240, width: double.infinity, fit: BoxFit.cover,),
//                    ),
//                  ],
//                ),
//              ),
//
//              buildHeading("Ingredients"),
//              buildContent(
//                ListView.builder(
//                  itemCount: selectedMeal.ingredients.length,
//                  itemBuilder: (context, i)=> Card(
//                    elevation: 4,
//                    color: Theme.of(context).primaryColor,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(15.0),
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(selectedMeal.ingredients[i], style: TextStyle(color: Colors.white,),),
//                    ),
//                  ),
//                ),
//              ),
//
//              buildHeading("Steps"),
//              buildContent(
//                ListView.builder(
//                  itemCount: selectedMeal.steps.length,
//                  itemBuilder: (context, i)=> Column(
//                    children: <Widget>[
//                      ListTile(
//                        leading: CircleAvatar(
//                          child: Text("# ${i+1}", style: TextStyle(color: Colors.white),),
//                          backgroundColor: Theme.of(context).primaryColor,
//                        ),
//                        title: Text(selectedMeal.steps[i]),
//                      ),
//                      Divider(height: 1.4,),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//
//      floatingActionButton: FloatingActionButton(
//        child: isFavorite(mealId)
//          ? Icon(Icons.favorite, color: Colors.red, size: 30.0,)
//          : Icon(Icons.favorite_border, color: Colors.deepPurple, size: 30.0,),
//        onPressed: (){
//          toogleFavorite(mealId);
////          Navigator.of(context).pop(mealId);
//        },
//      ),
//    );
//  }
//}
