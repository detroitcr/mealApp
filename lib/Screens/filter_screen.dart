import 'package:flutter/material.dart';
import 'package:screensapp/widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  final Function(Map<String,bool>) saveFilters;
  Map<String,bool> currentFilters;

  FiltersScreen(this.saveFilters,this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;

    super.initState();
  }


Widget _buildSwitchTile(String title,String description,bool currentValue, Function(bool)? updateValue){
  return SwitchListTile(
    title:Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,

  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(onPressed:() {

           final  _selectedFilters = {
             'gluten': _glutenFree,
             'lactose': _lactoseFree,
             'vegetarian': _vegetarian,
             'vegan': _vegan,
           };
            widget.saveFilters(_selectedFilters);
            },
                    icon:Icon(Icons.save) )

        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust Your Meal Screen',
            style: Theme.of(context).textTheme.subtitle1,),
          ),
          Expanded(
            child: ListView(
            children: [
              _buildSwitchTile('Gluten-Free',
                'Your meal is Gluten Free',
                _glutenFree,
                    (newValue)
                {

              setState(
                      () {
                _glutenFree = newValue;
              },
              );

            },
            ),
              _buildSwitchTile('Lactose-Free',
                  'Your meal is Lactose Free',
                  _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                      }),
                _buildSwitchTile('Vegetarian', 'Your meal is Vegetarian',
                    _vegetarian,
                        (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                        }),
              _buildSwitchTile('Vegan',
                  'Your meal is vegan',
                  _vegan,
                      (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
              })
            ],
            ),
          ),
        ],
      ),
    );
  }
}
