import 'package:flutter/material.dart';
import './main_drawer.dart';

class FilterScreen extends StatefulWidget {

  final Function filterMeal;
  final Map<String, dynamic> _filters;
  FilterScreen(this.filterMeal, this._filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  Map<String, bool> filter;

  bool isGluten= false;
  bool isLactose= false;
  bool isVegan= false;
  bool isVegetarian= false;

  @override
  void initState() {
    super.initState();
    isGluten= widget._filters["gluten"];
    isLactose= widget._filters["lactose"];
    isVegan= widget._filters["vegan"];
    isVegetarian= widget._filters["vegetarian"];
  }

  @override
  Widget build(BuildContext context) {

    buildSwitchListTile(bool value, String title, String description, Function changedValue){
      return SwitchListTile(
        activeColor: Theme.of(context).primaryColor,
        value: value,
        title: Text(title),
        subtitle: Text(description),
        onChanged: changedValue
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            splashColor: Colors.redAccent,
            onPressed: (){
              filter= {
                "gluten": isGluten,
                "lactose": isLactose,
                "vegan": isVegan,
                "vegetarian": isVegetarian,
              };
              widget.filterMeal(filter);
            },
          ),
        ],
      ),

      drawer: MainDrawer(),

      body: Container(
        padding: EdgeInsets.all(6),
//        width: double.infinity,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Adjust your meal section", style: Theme.of(context).textTheme.headline6),
              ),
            ),

            buildSwitchListTile(isGluten, "Gluten Free", "Only include gluten free meals", (item){
              setState(() {
                isGluten= item;
              });
            },),
            buildSwitchListTile(isLactose, "Lactose Free", "Only include lactose free meals", (item){
              setState(() {
                isLactose= item;
              });
            }),
            buildSwitchListTile(isVegan, "Vegan", "Only include vegan meals", (item){
              setState(() {
                isVegan= item;
              });
            }),
            buildSwitchListTile(isVegetarian, "Vegetarian", "Only include vegetarian meals", (item){
              setState(() {
                isVegetarian= item;
              });
            }),
          ],
        ),
      ),
    );
  }
}












//import 'package:flutter/material.dart';
//import './main_drawer.dart';
//
//class FiltersScreen extends StatefulWidget {
//
//  final Map<String, bool> _filters;
//  final Function saveFilters;
//  FiltersScreen(this._filters, this.saveFilters);
//
//  @override
//  _FiltersScreenState createState() => _FiltersScreenState();
//}
//
//class _FiltersScreenState extends State<FiltersScreen> {
//
//  var _glutenFree= false;
//  var _lactoseFree= false;
//  var _vegan= false;
//  var _vegetarian= false;
//
//  @override
//  void initState() {
//    super.initState();
//    _glutenFree= widget._filters["gluten"];
//    _lactoseFree= widget._filters["lactose"];
//    _vegan= widget._filters["vegan"];
//    _vegetarian= widget._filters["vegetarian"];
//  }
//
//  buildSwitchListTile(String title, String description, bool currentValue, Function changedValue){
//    return SwitchListTile(
//      title: Text(title),
//      subtitle: Text(description),
//      value: currentValue,
//      onChanged: changedValue,
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Filters"),
//        elevation: 5,
//        actions: <Widget>[
//          FlatButton.icon(
//            onPressed: (){
//              Map<String, bool> filters= {
//                "gluten": _glutenFree,
//                "lactose": _lactoseFree,
//                "vegan": _vegan,
//                "vegetarian": _vegetarian,
//              };
//              widget.saveFilters(filters);
//            },
//            icon: Icon(Icons.save),
//            label: Text("Save")
//          ),
//        ],
//      ),
//      drawer: MainDrawer(),
//
//      body: Column(
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.all(20.0),
//            alignment: Alignment.topCenter,
//            child: Text("Adjust your meal selection", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2, fontSize: 20.0),),
//          ),
//
//          Expanded(
//            child: ListView(
//              children: <Widget>[
//                buildSwitchListTile("Gluten Free", "only include gluten-free meals", _glutenFree, (newValue){
//                  setState(() {
//                    _glutenFree= newValue;
//                  });
//                },),
//                buildSwitchListTile("Lactose Free", "only include lactose-free meals", _lactoseFree, (newValue){
//                  setState(() {
//                    _lactoseFree= newValue;
//                  });
//                },),
//                buildSwitchListTile("Vegan", "only include vegan-free meals", _vegan, (newValue){
//                  setState(() {
//                    _vegan= newValue;
//                  });
//                },),
//                buildSwitchListTile("Vegetarian", "only include vegetarian meals", _vegetarian, (newValue){
//                  setState(() {
//                    _vegetarian= newValue;
//                  });
//                },),
//              ],
//            ),
//          ),
//
//        ],
//      ),
//    );
//  }
//}
