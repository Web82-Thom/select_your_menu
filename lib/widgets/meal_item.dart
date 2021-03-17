import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  //propriété pour afficher un repas
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //conxtructeur
  MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch(complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Moyen';
        break;
      case Complexity.Hard:
        return ' Difficile';
        break;
      default : 
        return 'Inconnu';
    }
  } 

  String get affordabilityText {
    switch(affordability) {
      case Affordability.Affordable:
        return 'Abordable';
        break;
      case Affordability.Pricey:
        return 'Coûteux';
        break;
      case Affordability.Luxurious:
        return ' Luxueux';
        break;
      default : 
        return 'Inconnu';
    }
  }


  //methode de selection de repas
  void selecMeal() {}

  @override
  Widget build(BuildContext context) {
    //InkWell element clickable
    return InkWell(
      onTap: selecMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //block de construction les uns sur les autres Stack = une pile
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15,),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      //envelope dans la boite le texte si il est long 
                      softWrap: true,
                      // disparait si trop grand
                      overflow: TextOverflow.fade,
                      
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                //allignement spacearound
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //la duréé
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('$duration min'),
                    ],
                  ),
                  // la complexiter
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text(complexityText,),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text(affordabilityText,),
                    ],
                  ),

                ],
                  
                

            ),
            ),
          ],
        ),
      ),
    );
  }
}
