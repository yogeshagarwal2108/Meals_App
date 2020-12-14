import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  buildListTile(IconData icon, String title, Function navigatePage){
    return ListTile(
      leading: Icon(icon),
      onTap: navigatePage,
      title: Text(title, style: TextStyle(fontSize: 20, letterSpacing: 1.2, color: Colors.black, fontWeight: FontWeight.w700)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 160,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Cooked Up", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35, color: Colors.white, letterSpacing: 1.2)),
            ),
          ),

          buildListTile(Icons.category, "Category", (){
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile(Icons.settings, "Filters", (){
            Navigator.of(context).pushReplacementNamed("/filters");
          }),
        ],
      ),
    );
  }
}














//import 'package:flutter/material.dart';
//import './filters_screen.dart';
//
//class MainDrawer extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    buildListItem(String item, IconData icon, Function navigatePage){
//      return ListTile(
//        title: Text(item, style: Theme.of(context).textTheme.headline6,),
//        leading: Icon(icon, size: 25.0,),
//        onTap: navigatePage,
//      );
//    }
//
//    return Drawer(
//      child: Column(
//        children: <Widget>[
//          Container(
//            height: 140.0,
//            alignment: Alignment.centerLeft,
//            width: double.infinity,
//            padding: EdgeInsets.all(20.0),
//            color: Theme.of(context).primaryColor,
//            child: Text("Cooked Up!", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900, letterSpacing: 1.4, color: Colors.redAccent),),
//          ),
//          buildListItem("Meals", Icons.restaurant, (){
//            Navigator.of(context).pushReplacementNamed("/");
//          }),
//          buildListItem("Filters", Icons.settings, (){
//            Navigator.of(context).pushReplacementNamed("/filters");
//          }),
//        ],
//      ),
//    );
//  }
//}
