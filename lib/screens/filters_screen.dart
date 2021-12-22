
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName = '/Filter_Screen' ;
  final Function saveFilters;
  final Map<String , bool > filters;

  const FiltersScreen({Key key, this.saveFilters, this.filters}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

   bool _glutenFree = false;
   bool _lactoseFree= false;
   bool _vegan= false;
   bool _vegetarian=false;

   @override
  void initState() {
_glutenFree = widget.filters['gluten'];
_lactoseFree = widget.filters['lactose'];
_vegan = widget.filters['vegan'];
_vegetarian = widget.filters['vegetarian'];

  }

  Widget _buildSwitchListTile(bool value ,String title , String describtion , Function onChanged){
     return SwitchListTile(value: value, onChanged: onChanged , title: Text(title), subtitle: Text(describtion),);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.save),onPressed: (){
            final selectedFilters = {
              'gluten' : _glutenFree ,
              'lactose' : _lactoseFree ,
              'vegan' : _vegan,
              'vegetarian' :_vegetarian
            };
            widget.saveFilters(selectedFilters);
          },)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),child: Text("Adjust your meal selection",style: Theme.of(context).textTheme.title,),),
          Expanded(child: ListView(children: [
            _buildSwitchListTile(_glutenFree, "Gluten-Free", "All Meals are Gluten-free", (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchListTile(_lactoseFree, "Lactose-Free", "All Meals are Luctose-free", (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            _buildSwitchListTile(_vegan, "Vegan", "All Meals are Vegan", (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            _buildSwitchListTile(_vegetarian, "Vegetarian", "All Meals is Vegetarian", (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
          ],))
        ],
      ),
    );
  }
}
