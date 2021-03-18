import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //pas besoin du scaffold appBar, car il est gerer par tabsScreen
    return GridView(
        padding: const EdgeInsets.all(25),
        //jappel dans mon children ma liste
        children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
            catData.id,
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
      );
}
}
