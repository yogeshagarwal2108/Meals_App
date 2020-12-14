import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meals.dart';
import './main_drawer.dart';

class TabScreen extends StatefulWidget {

  final List<Meal> favoriteMeal;
  TabScreen(this.favoriteMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Map<String, dynamic>> _pages;
  int selectedPage= 0;

  selectPage(int index){
    setState((){
      selectedPage= index;
    });
  }

  @override
  Widget build(BuildContext context) {

    _pages= [
      {"page": CategoryScreen(), "title": "Category"},
      {"page": FavoriteScreen(widget.favoriteMeal), "title": "Favorite"}
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPage]["title"]),
      ),

      drawer: MainDrawer(),

      body: _pages[selectedPage]["page"],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: selectPage,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
        ]
      ),
    );
  }
}
















//import 'package:flutter/material.dart';
//import 'categories_screen.dart';
//import 'favorites_screen.dart';
//import "./main_drawer.dart";
//import '../models/meals.dart';
//
//class TabsScreen extends StatefulWidget {
//
//  final List<Meal> favoriteMeal;
//  TabsScreen(this.favoriteMeal);
//
//  @override
//  _TabsScreenState createState() => _TabsScreenState();
//}
//
//class _TabsScreenState extends State<TabsScreen> {
//
//  List<Map<String, dynamic>> _pages;
//
//  @override
//  void initState() {
//    super.initState();
//    _pages= [
//      {"page": CategoryScreen(), "title": "Categories"},
//      {"page": FavoritesScreen(widget.favoriteMeal), "title": "Favorites"}
//    ];
//  }
//
//  int selectedPageIndex= 0;
//  Widget selectPage(int index){
//    setState(() {
//      selectedPageIndex= index;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(_pages[selectedPageIndex]["title"]),
//        elevation: 4,
//      ),
//
//      drawer: MainDrawer(),
//      body: _pages[selectedPageIndex]["page"],
//
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: selectedPageIndex,
////        iconSize: 25,
////        type: BottomNavigationBarType.shifting,
//        onTap: selectPage,
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(Icons.category),
//            title: Text("Categories"),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.favorite),
//            title: Text("Favorites"),
//          ),
//        ],
//      ),
//    );
//  }
//}
