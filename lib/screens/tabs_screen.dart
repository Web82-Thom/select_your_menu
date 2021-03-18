import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './category_screen.dart';

//le widget qui va gerer les appel des onglets selon la page afficher
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  //stockage pages dans une List
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Mes favories',
    },
  ];
  //indexation
  int _selectedPageIndex = 0;
  
  //methode pour selectionner une page
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //controller d'onglet DefaultTabController ATTENTION A L'ORDRE tab(1),tab(2) et dans le body CatgoriesScreen et FavoritesScreen onglet en haut de page sous appbar
    //change de methode en plaçant les onglets en BottomNavigationBarItem
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      //onglets en BottomnavigationBarItem
      bottomNavigationBar:BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          //onglet catégorie
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category
            ),
            label: 'Catégories',
          ),
          //onglet mes favories
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            label: 'Mes favories',
          ),
        ],
      ) ,
    );
  }
}