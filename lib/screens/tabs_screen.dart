// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/drawer_design.dart';
import 'categoies_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabsScreen(
    this.favoriteMeals, {
    Key? key,
  }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0; //meal APP
  void selectedItem(int index, BuildContext ctx) {
    setState(() {
      _selectedIndex = index;
    });
  }
  late List<Widget> _page;
  @override
  void initState() {
     _page  = [const CategoriesScreen(), FavoriteScreen(widget.favoriteMeals)];

    super.initState();
  }

//list of Widget will go to it when it Tapped
//list of title of widget
  final widgetTitle = ['Meal App', 'Favorites'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title change depend on the widget
        title: Text(widgetTitle.elementAt(_selectedIndex)),
      ),
      ////title change depend on what tapped
      body: _page.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite')
          ],
          selectedFontSize: 18,
          unselectedFontSize: 15,
          currentIndex: _selectedIndex,
          onTap: ((value) {
            selectedItem(value, context);
          }),
          backgroundColor: Colors.black,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
        ),
      ),
      drawer: const DrawerDesign(),
    );
  }
}
