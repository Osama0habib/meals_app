

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';


import '../dummy_data.dart';


class CategoryMealsScreen extends StatefulWidget {
  // final String id;
  // final String title;
static const routeName = '/Category_Meals';

  final List<Meal> avalabileMeals;

  CategoryMealsScreen(this.avalabileMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  bool _loadInitData = false;
  @override
  void didChangeDependencies() {
    if(!_loadInitData){
      final routeArg = ModalRoute.of(context).settings.arguments as Map<String , String>;
      categoryTitle = routeArg["title"];
      final categoryId = routeArg["id"];
      categoryMeals = widget.avalabileMeals.where((meal) => meal.categories.contains(categoryId)).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }
  void _removeItem(String mealId){
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text(categoryTitle),
        ),
        drawer: MainDrawer(),
        body: ListView.builder(itemCount: categoryMeals.length,itemBuilder: (ctx , index) {
         return MealItem(id: categoryMeals[index].id,imageUrl: categoryMeals[index].imageUrl,title:  categoryMeals[index].title,duration:  categoryMeals[index].duration,affordability:  categoryMeals[index].affordability,complexity:  categoryMeals[index].complexity,removeItem: _removeItem,);
    } ,
        ),
    );
  }
}
