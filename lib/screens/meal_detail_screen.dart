
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/Meal_Detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen({@required this.toggleFavorite,@required this.isFavorite});
  Widget buildSectionTitle(BuildContext context,String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
  Widget buildContainer(child){
    return Container(
        width: 300,
        height: 150,
        padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(
    color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10)),
    child: child );
  }

  @override
  Widget build(BuildContext context) {
    final argId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => argId == meal.id);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                      color: Theme.of(ctx).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]),
                      ))),) ,
              buildSectionTitle(context, 'Steps'),
              buildContainer(ListView.builder(itemCount: selectedMeal.steps.length,itemBuilder: (ctx , index) => Column(
                children: [
                  ListTile(title: Text(selectedMeal.steps[index]),leading: CircleAvatar(child: Text('# ${index +1}'),),),
                Divider(thickness: 2,)],
              )))
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(
         isFavorite(argId)? Icons.star : Icons.star_border),onPressed: () {toggleFavorite(argId);},),
    );
  }
}
