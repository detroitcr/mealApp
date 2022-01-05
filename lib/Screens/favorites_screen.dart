import 'package:flutter/material.dart';
import 'package:screensapp/models/meal.dart';
import 'package:screensapp/widgets/meal_item.dart';
class FavouritesScreen extends StatelessWidget {

final List<Meal> favoriteMeals;

FavouritesScreen(this.favoriteMeals);


  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no Favourites yet - add start to some'),
      );
    }
else{
  return ListView.builder(
    itemBuilder: (ctx,index){
      return MealItem(
        title: favoriteMeals[index].title,
        imageUrl: favoriteMeals[index].imageUrl,
        duration: favoriteMeals[index].duration,
        complexity: favoriteMeals[index].complexity,
        affordability: favoriteMeals[index].affordability,
        id: favoriteMeals[index].id,

      );

    },
    itemCount: favoriteMeals.length,
  );
    }
  }
}
