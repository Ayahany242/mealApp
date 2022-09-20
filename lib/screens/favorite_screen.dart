import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meals_Item.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = 'Favorite Screen';
  List<Meal> favoriteMeals;
  FavoriteScreen(
    this.favoriteMeals, {
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<Meal> favoriteMeal;
/*   String get dd {
    if (s == null) {
      return 'sfashgsafh';
    }
    return s!;
  } */
  List<Meal>  f() {
   return favoriteMeal = widget.favoriteMeals;
  }

  @override
  void initState() {
    favoriteMeal = widget.favoriteMeals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.favoriteMeals.isEmpty
          ? const Center(
              child: Text('You have no favorites yet - Start adding some!'))
          : ListView.builder(
              itemBuilder: ((context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  child: MealsItem(
                    imageUrl: favoriteMeal[index].imageUrl,
                    title: favoriteMeal[index].title,
                    affordability: favoriteMeal[index].affordability,
                    duration: favoriteMeal[index].duration,
                    complexity: favoriteMeal[index].complexity,
                    id: favoriteMeal[index].id,
                  ),
                );
              }),
              itemCount: favoriteMeal.length,
            ),
    );
  }
}
