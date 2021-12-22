
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon , String title , Function onTabHandler){
    return ListTile(
      leading: Icon(icon , size: 26,),
      title: Text(title , style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "RobotoCondensed",
      ),
      ),
      onTap: onTabHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16,
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
                "Cooking Up",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30 ,
                color: Theme.of(context).primaryColor) ,
            ),
          ),
          SizedBox(height: 20,) ,
          buildListTile(Icons.restaurant, 'Meals',() { Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile(Icons.settings, 'Filters',() { Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
