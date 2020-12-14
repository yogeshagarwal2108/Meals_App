import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import 'screens/tabs_screen.dart';
import 'dummy_data.dart';
import './models/meals.dart';
import './screens/filters_screen.dart';

void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favouriteMeal= [];
  List<Meal> availableMeals= DUMMY_MEALS;

  Map<String, dynamic> _filters= {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  //filter screen
  setFilter(Map<String, dynamic> filter){
    setState(() {
      _filters= filter;
      refreshList();
    });
  }

  refreshList(){
    return availableMeals= DUMMY_MEALS.where((meal){
      if(!meal.isGlutenFree && _filters["gluten"]){
        return false;
      }
      else if(!meal.isLactoseFree && _filters["lactose"]){
        return false;
      }
      else if(!meal.isVegan && _filters["vegan"]){
        return false;
      }
      else if(!meal.isVegetarian && _filters["vegetarian"]){
        return false;
      }
      return true;
    }).toList();
  }

  //favorite screen
  toogleFavorite(String mealId){
    int existingMealIndex= favouriteMeal.indexWhere((meal){
      return meal.id== mealId;
    });

    if(existingMealIndex>= 0){
      setState((){
        favouriteMeal.removeAt(existingMealIndex);
      });
    }
    else{
      setState(() {
        favouriteMeal.add(DUMMY_MEALS.firstWhere((meal){
          return meal.id== mealId;
        }));
      });
    }
  }

  bool isFavorite(String mealId){
    return favouriteMeal.any((meal){
      return meal.id== mealId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meal App",
      theme: ThemeData(
        fontFamily: "Raleway",
        primaryColor: Colors.red,
        accentColor: Colors.white,

        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20.0,
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),

        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            button: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black45,
              fontSize: 25.0,
            ),
          ),
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: TabScreen(favouriteMeal),

      routes: {
        "/category-meals": (context)=> CategoryMealScreen(availableMeals),
        "/meal-detail": (context)=> MealDetailScreen(toogleFavorite, isFavorite),
        "/filters":(context)=> FilterScreen(setFilter, _filters),
      },

//    onGenerateRoute: (settings){
//        print(settings.arguments);
//        return MaterialPageRoute(
//          builder: (context)=> CategoryScreen(),
//        );
//
////        if(settings.name== "/meal-detail"){
////          return MaterialPageRoute(builder: (context)=> CategoryScreen(),);
////        }
//      },


//    onUnknownRoute: (settings){
//        return MaterialPageRoute(
//          builder: (context)=> CategoryScreen(),
//        );
//      },

    );
  }
}













//import 'package:flutter/material.dart';
//import './screens/categories_screen.dart';
//import './screens/category_meals_screen.dart';
//import './screens/meal_detail_screen.dart';
//import './screens/tabs_screen.dart';
//import './screens/filters_screen.dart';
//import './models/meals.dart';
//import './dummy_data.dart';
//
//void main()=> runApp(MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//
//  static Map<String, bool> _filters= {
//    "gluten": false,
//    "lactose": false,
//    "vegan": false,
//    "vegetarian": false,
//  };
//
//  List<Meal> availableMeals= DUMMY_MEALS;
//
//  List<Meal> favoriteMeal= [];
//
//  toogleFavorite(String mealId){
//    final existingMealIndex= favoriteMeal.indexWhere((meal){
//      return meal.id== mealId;
//    });
//
//    if(existingMealIndex>= 0){
//      setState(() {
//        favoriteMeal.removeAt(existingMealIndex);
//      });
//    }
//    else{
//      setState(() {
//        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal){
//          return meal.id== mealId;
//        }));
//      });
//    }
//  }
//
//  bool isFavorite(String mealId){
//    return favoriteMeal.any((meal){
//      return meal.id== mealId;
//    });
//  }
//
//  setFilters(Map<String, bool> filter){
//    setState(() {
//      _filters= filter;
//      refreshMeals();
//    });
//  }
//
//
//  refreshMeals(){
//    availableMeals= DUMMY_MEALS.where((meals){
//      if(!meals.isGlutenFree && _filters["gluten"]){
//        return false;
//      }
//      if(!meals.isLactoseFree && _filters["lactose"]){
//        return false;
//      }
//      if(!meals.isVegan && _filters["vegan"]){
//        return false;
//      }
//      if(!meals.isVegetarian && _filters["vegetarian"]){
//        return false;
//      }
//      return true;
//    }).toList();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "Meals App",
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primaryColor: Colors.indigoAccent,
//        splashColor: Colors.white,
////        canvasColor: Color.fromRGBO(190, 100, 220, 1),
//
//        textTheme: ThemeData.light().textTheme.copyWith(
//          button: TextStyle(
//            fontWeight: FontWeight.bold,
//            fontSize: 20.0,
//            fontFamily: "Raleway",
//          ),
//
//          headline5: TextStyle(
//            fontWeight: FontWeight.bold,
//            fontSize: 20.0,
//            fontFamily: "RobotoCondensed",
//            color: Colors.white,
//          ),
//
//          headline6: TextStyle(
//            fontSize: 22.0,
//            fontWeight: FontWeight.bold,
//            fontFamily: "RobotoCondensed",
//            letterSpacing: 1.3,
//            color: Colors.black87,
////            height: 12.0,
//          ),
//        ),
//
//        appBarTheme: AppBarTheme(
//          textTheme: ThemeData.light().textTheme.copyWith(
//            headline6: TextStyle(
//              fontSize: 20.0,
//              fontFamily: "RobotoCondensed",
//              fontWeight: FontWeight.bold,
//              color: Colors.black87,
//            ),
//          ),
//        ),
//      ),
//
//      home: TabsScreen(favoriteMeal),
//
//      routes: {
//        "/category-meals": (context)=> CategoryMealsScreen(availableMeals),
//        "/meal-detail": (context)=> MealDetailScreen(toogleFavorite, isFavorite),
//        "/filters": (context)=> FiltersScreen(_filters, setFilters),
//      },
//
//      onGenerateRoute: (settings){
//        print(settings.arguments);
//        return MaterialPageRoute(
//          builder: (context)=> CategoryScreen(),
//        );
//
////        if(settings.name== "/meal-detail"){
////          return MaterialPageRoute(builder: (context)=> CategoryScreen(),);
////        }
//      },
//
////      onUnknownRoute: (settings){
////        return MaterialPageRoute(
////          builder: (context)=> CategoryScreen(),
////        );
////      },
//    );
//  }
//}
