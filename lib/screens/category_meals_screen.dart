import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {

  final List<Meal> availableMeal;
  CategoryMealScreen(this.availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String id;
  String title;
  List<Meal> categoryList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs= ModalRoute.of(context).settings.arguments as Map<String, String>;
    id= routeArgs["id"];
    title= routeArgs["title"];

    categoryList= widget.availableMeal.where((meal){
      return meal.categories.contains(id);
    }).toList();
  }

  deleteMeal(String mealId){
    return setState(() {
      categoryList.removeWhere((meal){
        return meal.id== mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: Theme.of(context).textTheme.headline6,),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: categoryList.length==0
          ? Center(
              child: Text("No meals in $title", style: Theme.of(context).textTheme.headline6,),
            )
          : ListView(
          children: categoryList.map((meal){
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
      ),
    );
  }
}












//import 'package:flutter/material.dart';
//import 'package:meals_app/widgets/meal_item.dart';
//import '../models/meals.dart';
//
//class CategoryMealsScreen extends StatefulWidget {
//
//  final List<Meal> availableMeals;
//
//  CategoryMealsScreen(this.availableMeals);
//
//  @override
//  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
//}
//
//class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
//
//  List<Meal> categoryList;
//  String title= "";
//
////  @override
////  void initState() {
////    super.initState();
////
////    final routeArgs= ModalRoute.of(context).settings.arguments as Map<String, String>;
////    final String id= routeArgs["id"];
////    title= routeArgs["title"];
////
////    categoryList= DUMMY_MEALS.where((item){
////      return item.categories.contains(id);
////    }).toList();
////
////  }
//
//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//
//    final routeArgs= ModalRoute.of(context).settings.arguments as Map<String, String>;
//    final String id= routeArgs["id"];
//    title= routeArgs["title"];
//
//    categoryList= widget.availableMeals.where((item){
//      return item.categories.contains(id);
//    }).toList();
//  }
//
//  deleteMeal(String mealId){
//    setState(() {
//      categoryList.removeWhere((meal){
//        return meal.id== mealId;
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(title, style:Theme.of(context).appBarTheme.textTheme.headline5),
//      ),
//
//      body: ListView.builder(
//        itemCount: categoryList.length,
//        itemBuilder: (context, i){
//          return MealItem(id: categoryList[i].id, title: categoryList[i].title, imageUrl: categoryList[i].imageUrl, duration: categoryList[i].duration,
//            affordability: categoryList[i].affordability, complexity: categoryList[i].complexity, deleteMeal: deleteMeal,);
//        }
//      ),
//    );
//  }
//}
