import 'dart:html';

import 'package:flutter/material.dart';
import 'package:screensapp/Screens/categories_screen.dart';
import 'package:screensapp/Screens/category_meals_screen.dart';
import 'package:screensapp/Screens/filter_screen.dart';
import 'package:screensapp/Screens/meal_detail_screen.dart';
import 'package:screensapp/Screens/tab_screen.dart';
import 'package:screensapp/dummy_idata.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  Map<String,bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegetarian':false,
    'vegan':false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String,bool> filterData){
      setState(() {
        _filters = filterData;

        _availableMeals = DUMMY_MEALS.where((meal){
          if(_filters['gluten']! && !meal.isGlutenFree!){
            return false;
          }
            if(_filters['lactose']! && !meal.isLactoseFree!){
              return false;
            }
              if(_filters['vegetarian']! && !meal.isVegetarian!){
                return false;
              }
                if(_filters['vegan']! && !meal.isVegan!){
                  return false;
                }
            return true;

        }).toList();
      });
  }

void _toggleFavorites(String mealId){
final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
if(existingIndex >= 0){
setState(() {
  _favoriteMeals.removeAt(existingIndex);
});
} else{
  setState(() {
    _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId ),);
  });
}

}

bool _isMealFavorite(String id){
 return _favoriteMeals.any((meal) => meal.id == id);
}




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DailyMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1,)
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      initialRoute: '/', // default route
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorites,_isMealFavorite),
        FiltersScreen.routeName: (ctx)  => FiltersScreen(_setFilters,_filters),
      },
      onGenerateRoute: (settings){
        // print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
