import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  //construction de ma route
  static const routeName = '/filtres';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes filtres'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Hello',),
      ),
    );
  }
}