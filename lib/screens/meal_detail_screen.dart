import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details' ;
  //Creation d'un widget constructeur pour les Titres afin d'eviter de repeter du code
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,),
      padding: EdgeInsets.all(10),
      child: Text(
        text, 
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10,),
              padding: EdgeInsets.all(10,),
              height: 200,
              width: 300,
              child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    //recupere ID
    final mealId = ModalRoute.of(context).settings.arguments;
    //recupere les data de ID et verfif ==
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    // final mealTitle = ModalRoute.of(context).settings.arguments;
      return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body:  SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  //adapter dans le container environnant
                  fit: BoxFit.cover,
                ),
              ),
              //appel du consctructeur pour les titres
              buildSectionTitle(context, 'ingrédient'),
              //appel du constructeur pour le container
              buildContainer(ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5, 
                        horizontal: 10
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                      )
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              //appel du consctructeur pour les titres
              buildSectionTitle(context, 'Les étapes'),
              //appel du constructeur pour le container
              buildContainer(ListView.builder(
                  itemBuilder: (ctx, index) => Column ( 
                    children : [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '${(index + 1)}'
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                      //widget separateur
                      Divider(
                        color: Colors.red,
                      ),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              )],
          ),
        ),
    );
  }
}