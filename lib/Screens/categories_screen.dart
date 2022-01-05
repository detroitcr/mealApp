import 'package:flutter/material.dart';
import 'package:screensapp/dummy_idata.dart';
import 'package:screensapp/widgets/categorie_item.dart';

class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  final appBar =AppBar(
    title: const Text('Deli Meals'),
  );
    return  GridView(
          padding: const EdgeInsets.all(25),
          children:DUMMY_CATEGORIES.map((catData) => CategoryItem(
            catData.color,
                catData.title,
                catData.id,

                // title: catData.title,
                // color: catData.color,
                // id: catData.id,
        )).toList(),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
    ),
    );
  }
}

