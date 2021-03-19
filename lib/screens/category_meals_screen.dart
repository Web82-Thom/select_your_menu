import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
 CategoryMealsScreen(this.availableMeals);
  

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}
  class _CategoryMealsScreenState extends State<CategoryMealsScreen> { 
  //charge les propriétées
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadInitData = false;
  //charger tous les repas qui sont basés du Id de la categorie que je reçoit
  @override
  void initState() {
    
    super.initState();
  }
  
  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      //retrouver la recette par rapport à sa categorie
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }
  //methode pour supprimer une recette
  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      // Creation de la liste des recettes
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            imageUrl:  displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
