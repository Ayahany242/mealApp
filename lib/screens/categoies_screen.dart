import 'package:flutter/material.dart';
import '../dummy_data.dart';

import '../widget/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//the first  screen
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((item) => CategoriesItem(
                  id: item.id,
                  title: item.title,
//color: item.color,
                  image: item.image,
                ))
            .toList(),
      ),
    );
  }
}
