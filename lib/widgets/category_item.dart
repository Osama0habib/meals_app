import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color ;

  CategoryItem(this.title, this.color, this.id);
 void goToRecipes(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,arguments:{"id":id , "title" : title} );
    }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => goToRecipes(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).accentColor,

      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,
          style:Theme.of(context).textTheme.title ,),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),

        borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
