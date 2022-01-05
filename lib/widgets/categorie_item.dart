import 'package:flutter/material.dart';
import 'package:screensapp/dummy_idata.dart';
import 'package:screensapp/Screens/category_meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String id;
   final String title;

   final Color? color;

   void selectCategory(BuildContext context) {
     Navigator.of(context).pushNamed(
       CategoryMealsScreen.routeName,
       arguments: {
         'id':id,
         'title':title,
     },
  );
}

// positional constructor
 // CategoryItem( this.color, this.title);
// named constructor
  CategoryItem(this.color, this.title, this.id);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        // ?? null check operator ! null declare operator
        child: Text(title,
          style: Theme.of(context).textTheme.subtitle1 ,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color?.withOpacity(0.7)?? Colors.amberAccent,
            color?? Colors.amber,
          ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ) ;
  }
}



