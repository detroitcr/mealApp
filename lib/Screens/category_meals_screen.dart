import 'package:flutter/material.dart';
import 'package:screensapp/models/meal.dart';
import '../dummy_idata.dart';
import '../widgets/meal_item.dart';


class  CategoryMealsScreen extends StatefulWidget {

static const routeName ='category-meals';

final List<Meal> availableMeals;

CategoryMealsScreen(this.availableMeals);

  @override


  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadInitData = false;



  @override
  void initState() {


    super.initState();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

@override
  void didChangeDependencies() {
    // _loadInintData != null;
    if(!_loadInitData){
      final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      categoryTitle = routeArgs['title'];
      final categoryid = routeArgs['id'];
      displayedMeals = widget.availableMeals.where(
              (meal) {
            return meal.categories!.contains(categoryid);
          }
      ).toList();
      _loadInitData = true;
    }

    super.didChangeDependencies();
  }


  // final String categoryId;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body:ListView.builder(
          itemBuilder: (ctx,index){
            return MealItem(
                title: displayedMeals![index].title,
                imageUrl: displayedMeals![index].imageUrl,
                duration: displayedMeals![index].duration,
                complexity: displayedMeals![index].complexity,
                affordability: displayedMeals![index].affordability,
                id: displayedMeals![index].id,

            );

          },
      itemCount: displayedMeals!.length,
      ),
      // Center(
      //   child: Text('The Recipes For The Category!'),
      // ),
    );
  }
}
