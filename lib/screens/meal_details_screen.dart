import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widget/list_view_design.dart';

class MealDetailsScreen extends StatelessWidget {
  Function addRemoveMeal;
  Function isFavorite;
  static const routeName = 'Meal Details Screen';
  MealDetailsScreen(
    this.addRemoveMeal,
    this.isFavorite, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //to get the meal ID
    final argId = ModalRoute.of(context)!.settings.arguments as String;
//get the meal selected Details from DUMMY_MEALS by its Id using firstWhere
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == argId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            //meal Image
            Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),

            buildTitleSection(context, 'Ingredients'),
            buildContainer(selectedMeal.ingredients, 'ingredients'),
            buildTitleSection(context, 'Steps'),
            buildContainer(selectedMeal.steps, 'steps'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addRemoveMeal(selectedMeal.id);
        },
        splashColor: Colors.amber,
        child: Icon(
          isFavorite(selectedMeal.id) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

//function to build the ListView Design
  Container buildContainer(List mealList, String dataName) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 150,
        width: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: ListViewDesign(
          //widget to build Item in ListView Design
          data: mealList,
          dataName: dataName,
        ));
  }

//function to build the title
  Padding buildTitleSection(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
