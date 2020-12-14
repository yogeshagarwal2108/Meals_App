import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {

  final List favoriteMeal;
  FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: favoriteMeal==null
        ? Center(
            child: Text("No favorites yet.. select one", style: Theme.of(context).textTheme.headline6,),
          )
        : ListView(
        children: favoriteMeal.map((meal){
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            steps: meal.steps,
            ingredients: meal.ingredients,
          );
        }).toList(),
      ),
    );
  }
}














//import 'package:flutter/material.dart';
//import '../models/meals.dart';
//import '../widgets/meal_item.dart';
//
//class FavoritesScreen extends StatefulWidget {
//
//  final List<Meal> favoriteMeal;
//  FavoritesScreen(this.favoriteMeal);
//
//  @override
//  _FavoritesScreenState createState() => _FavoritesScreenState();
//}
//
//class _FavoritesScreenState extends State<FavoritesScreen> {
//  @override
//  Widget build(BuildContext context) {
//    if(widget.favoriteMeal.isEmpty){
//      return Center(
//        child: Text("No favorites yet - please select one"),
//      );
//    }
//    else{
//      return ListView.builder(
//        itemCount: widget.favoriteMeal.length,
//        itemBuilder: (context, i){
//          return MealItem(id: widget.favoriteMeal[i].id, title: widget.favoriteMeal[i].title, imageUrl: widget.favoriteMeal[i].imageUrl, duration: widget.favoriteMeal[i].duration,
//            affordability: widget.favoriteMeal[i].affordability, complexity: widget.favoriteMeal[i].complexity);
//        }
//      );
//    }
//  }
//}
