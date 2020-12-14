import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> steps;
  final List<String> ingredients;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.steps,
    @required this.ingredients,
  });


  //Complexity to String
  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

//Affordability to String
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Expensive";
        break;
      default:
        return "Unknown";
    }
  }


  buildIconItem(IconData icon, String title){
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 5,),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed("/meal-detail", arguments: id).then((mealId){
          if(mealId!= null){
//            deleteMeal(mealId);
          }
        });
      },
      splashColor: Colors.redAccent,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),

        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                  child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity,height: 250.0)
                ),
                Positioned(
                  bottom: 8,
                  right: 5,
                  child: Container(
                    width: 270,
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    color: Colors.black45,
                    child: Text(title, textAlign: TextAlign.left, style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.fade,),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildIconItem(Icons.access_time, "$duration min"),
                  buildIconItem(Icons.work, complexityText),
                  buildIconItem(Icons.attach_money, affordabilityText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}













//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import '../models/meals.dart';
//
//class MealItem extends StatelessWidget {
//
//  final String id;
//  final String title;
//  final String imageUrl;
//  final int duration;
//  final Affordability affordability;
//  final Complexity complexity;
//  final Function deleteMeal;
//
//  MealItem({@required this.id, @required this.title, @required this.imageUrl, @required this.duration, @required this.affordability,
//    @required this.complexity, @required this.deleteMeal});
//
//  String get complexityText{
//    switch(complexity){
//      case Complexity.Simple:
//        return "Simple";
//        break;
//      case Complexity.Challenging:
//        return "Challenging";
//        break;
//      case Complexity.Hard:
//        return "Hard";
//        break;
//      default:
//        return "Unknown";
//    }
//  }
//
//String get affordabilityText{
//    switch(affordability){
//      case Affordability.Affordable:
//        return "Affordable";
//        break;
//      case Affordability.Pricey:
//        return "Pricey";
//        break;
//      case Affordability.Luxurious:
//        return "Expensive";
//        break;
//      default:
//        return "Unknown";
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    selectedMeal(){
//      Navigator.of(context).pushNamed("/meal-detail", arguments: id).then((mealId){
//        if(mealId!= null){
//          deleteMeal(mealId);
//        }
//      });
//    }
//
//    return InkWell(
//      splashColor: Colors.indigo,
//      onTap:()=> selectedMeal(),
//
//      child: Padding(
//        padding: EdgeInsets.all(5.0),
//        child: Card(
//          elevation: 5,
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(15.0),
//          ),
//          child: Column(
//            children: <Widget>[
//              Stack(
//                children: <Widget>[
//                  ClipRRect(
//                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
//                    child: Image.network(imageUrl, fit: BoxFit.cover, height: 240, width: double.infinity,),
//                  ),
//                  Positioned(
//                    bottom: 10,
//                    right: 7,
//                    child: Container(
//                      width: 280,
//                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                      color: Colors.black54,
//                      child: Text(title,
//                        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: Colors.white70, fontFamily: "RobotoCondensed"),
//                        overflow: TextOverflow.fade,
//                        softWrap: true,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//
//              Container(
//                padding: EdgeInsets.all(20.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        Icon(Icons.schedule),
//                        SizedBox( width: 5.0, ),
//                        Text("${duration} min", style: TextStyle(fontWeight: FontWeight.bold),),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Icon(Icons.work),
//                        SizedBox( width: 5.0, ),
//                        Text(complexityText, style: TextStyle(fontWeight: FontWeight.bold),),
//                      ],
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Icon(Icons.attach_money),
//                        SizedBox( width: 5.0, ),
//                        Text(affordabilityText, style: TextStyle(fontWeight: FontWeight.bold),),
//                      ],
//                    ),
//
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
