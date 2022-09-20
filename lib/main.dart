import 'package:flutter/material.dart';
import 'package:meal_task/dummy_data.dart';
import 'package:meal_task/models/meal.dart';
import '../screens/category_meal_screen.dart';
import '../screens/filter_screen.dart';
import '../screens/meal_details_screen.dart';
import '../screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = []; //favorite Meals List
  //add And Remove favorite Meals List
  void _addAndRemoveFavorite(String mealId) {
    final toggleFavorite = _favoriteMeals.indexWhere((meal) =>
        meal.id ==
        mealId); // send Index in of Meal that in favorite if it found gonna send its index in List or not found send -1
    if (toggleFavorite >= 0) {
      setState(() {
        _favoriteMeals.removeAt(toggleFavorite); //if it found remove it
        print(toggleFavorite);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          //if not found add meal to favorite List
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
        print(toggleFavorite);
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

//to Filtering the data
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        {
          if (_filters['glutenFree'] == true && meal.isGlutenFree == false) {
            return false;
          }
          if (_filters['lactoseFree'] == true && meal.isLactoseFree == false) {
            return false;
          }
          if (_filters['vegan'] == true && meal.isVegan == false) {
            return false;
          }
          if (_filters['vegetarian'] == true && meal.isVegetarian == false) {
            return false;
          }
          return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': ((context) => TabsScreen(_favoriteMeals)),
        CategoryMealScreen.routeName: ((context) =>
            CategoryMealScreen(_availableMeals)),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(_addAndRemoveFavorite, _isFavorite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
      theme: ThemeData(
          primarySwatch: Colors.pink,
          // floatingActionButtonTheme: FloatingActionButtonThemeData(
          //     backgroundColor: Colors.amber, splashColor: Colors.pink),
          canvasColor: const Color.fromARGB(249, 255, 253, 231),
          textTheme: const TextTheme(
            titleSmall: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 22,
                // fontWeight: FontWeight.w500,
                color: Colors.white),
            titleMedium: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
      title: 'flutter Demo',
    );
  }
}
