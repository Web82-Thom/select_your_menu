import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //construction de ma route
  static const routeName = '/filtres';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  //stocke les elements
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  //constructeur des listes de switch
  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes filtres'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Ajuster vos préférences',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(children: <Widget>[
              _buildSwitchListTile(
                'Sans Glutten', 
                'Uniquement les recettes sans glutten',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Végétarien', 
                'Uniquement les recettes végétariennes',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Végan', 
                'Uniquement les recettes végannes',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Sans lactose', 
                'Uniquement les recettes sans lactose',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
