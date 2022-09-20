import 'package:flutter/material.dart';
// import '../dummy_data.dart';
import '../models/meal.dart';
import '../widget/meals_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'Category Meal Screen';
  final List<Meal> _availableMeals;

  const CategoryMealScreen(this._availableMeals,{Key? key}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? argTitle;
  late List<Meal> filterCategory;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final argumentMap =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final argId = argumentMap['id'];
    argTitle = argumentMap['title'];
    filterCategory = widget._availableMeals.where((element) {
      return element.categories.contains(argId);
    }).toList();
    //_getCategories();
  }

//function to get the data from
  /* void _getCategories() async {
    final argumentMap =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final argId = argumentMap['id'];
    argTitle = argumentMap['title'];
    filterCategory = DUMMY_MEALS.where((element) {
      return element.categories.contains(argId);
    }).toList();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(argTitle!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            child: MealsItem(
              imageUrl: filterCategory[index].imageUrl,
              title: filterCategory[index].title,
              affordability: filterCategory[index].affordability,
              duration: filterCategory[index].duration,
              complexity: filterCategory[index].complexity,
              id: filterCategory[index].id,
            ),
          );
        }),
        itemCount: filterCategory.length,
      ),
    );
  }
}
