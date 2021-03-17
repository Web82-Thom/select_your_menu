import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Une liste avec GridView(remplace ListView) qui possede un mode constructeur
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        //jappel dans mon children ma liste
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  catData.title,
                  catData.color,
                ))
            .toList(),
        //argument obligatoire gridDelegate donne du style au gridView
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
