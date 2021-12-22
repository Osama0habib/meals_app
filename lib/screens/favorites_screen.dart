import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty ? Center(child: Text("You have no favorites yet!... Start adding some",style: Theme.of(context).textTheme.title,),) :ListView.builder(itemCount: favoriteMeals.length,itemBuilder: (ctx , index) {
      return MealItem(title: favoriteMeals[index].title,id: favoriteMeals[index].id,duration: favoriteMeals[index].duration,imageUrl: favoriteMeals[index].imageUrl,complexity: favoriteMeals[index].complexity,affordability: favoriteMeals[index].affordability);
    });
  }
}
