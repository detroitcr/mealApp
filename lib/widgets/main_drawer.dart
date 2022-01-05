import 'package:flutter/material.dart';
import 'package:screensapp/Screens/filter_screen.dart';

import 'custom_widgets.dart';






class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title,IconData icon,Function() tapHandler){
    return  ListTile(
      leading: Icon(icon,
        size: 26,
      ),
      title: Text(title,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      ),
      onTap: tapHandler,
    );
  }

 // Doubt kya yeh shi hein
 // widget

  // Widget buildDrawerContainer(BuildContext  context,String text){
  //   return                 Container(
  //     height: 120,
  //     width: double.infinity,
  //     padding: EdgeInsets.all(20),
  //     alignment: Alignment.centerLeft,
  //     color: Theme.of(context).accentColor,
  //     // decoration: BoxDecoration(
  //     //   borderRadius: BorderRadius.circular(15),
  //     // ),
  //     child: Text('You are great',
  //       style: TextStyle(
  //         fontSize: 30,
  //         fontWeight: FontWeight.w900,
  //         color: Theme.of(context).primaryColor,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
     // backgroundColor: Colors.transparent,
      child: Column(
        children: [
         // buildDrawerContainer(context, 'You are great'),
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  color: Theme.of(context).accentColor,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  child: Text('You are great',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
              Icons.restaurant,
              (){
              Navigator.of(context).pushReplacementNamed('/');
              }, ),
          buildListTile(
              'Filters',
              Icons.settings,
              (){
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              },),
        ],
      ),
    );
  }
}
