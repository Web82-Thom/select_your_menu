import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './category_screen.dart';

//le widget qui va gerer les appel des onglets seclon la page afficher

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    //controller d'onglet DefaultTabController ATTENTION A L'ORDRE tab(1),tab(2) et dans le body CatgoriesScreen et FavoritesScreen
    return DefaultTabController(
      length: 2,
      //reglage de l'onglet actif par defaut
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('recettes'),
          bottom: TabBar (
            tabs: <Widget> [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(icon: Icon(
                  Icons.star,
                ),
                text: 'Favories',),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
        ],),
      ),
    );
  }
}