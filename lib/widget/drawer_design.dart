import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class DrawerDesign extends StatelessWidget {
  const DrawerDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        //Container Contain The Text 
        Container(
          padding: const EdgeInsets.all(20),
          height: 120,
          width: double.infinity,
          color: Colors.black,
          alignment: Alignment.center,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
                fontFamily: 'Raleway'),
          ),
        ),
        listTileBuilder(Icons.restaurant, 'Meal', 0, context),
        listTileBuilder(Icons.settings, 'Filters', 1, context),
      ]),
    );
  }
// function to create ListTile
  ListTile listTileBuilder(
      IconData icon, String title, int pageIndex, BuildContext ctx) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 28,
            fontWeight: FontWeight.bold),
      ),
      //function to push to pages depend pageIndex of each Widget
      onTap: () {
        pageIndex == 0
            ? Navigator.of(ctx).pushReplacementNamed('/')
            : Navigator.of(ctx).pushReplacementNamed(FilterScreen.routeName);
      },
    );
  }
}
