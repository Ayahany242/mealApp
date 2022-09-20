import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';

class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  //final Color color;
  final String image;
  const CategoriesItem({
    Key? key,
    required this.id,
    required this.title,
    //required this.color,
    required this.image,
  }) : super(key: key);
  // function to push the data when item selected
  void selectedItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedItem(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      // i use stack to put 2 backgrounds
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              //background Image for inkwell in gridView
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(17)),
          // the color on image
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
        Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        )),
      ]),
    );
  }
}
