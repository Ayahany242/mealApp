import 'package:flutter/material.dart';

import 'package:meal_task/widget/drawer_design.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'Filter Screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  //to save Filters
  void saveFunction() {
    Map<String, bool> selectedFilters = {
      'glutenFree': _glutenFree,
      'lactoseFree': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian
    };
    widget.saveFilters(selectedFilters);
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['glutenFree']!;
    _lactoseFree = widget.currentFilters['lactoseFree']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  SwitchListTile switchListTileBuilder(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        actions: [
          IconButton(onPressed: saveFunction, icon: const Icon(Icons.save))
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Adjust Your Meal Section',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(children: [
                switchListTileBuilder('Gluten-Free',
                    'Only include gluten-free meals', _glutenFree, (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                switchListTileBuilder('lactose-free',
                    'Only include lactose-free meals', _lactoseFree, (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                switchListTileBuilder(
                    'Vegetarian', 'Only include Vegetarian meals', _vegetarian,
                    (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
                switchListTileBuilder(
                    'Vegan', 'Only include vegan meals', _vegan, (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
              ]),
            )
          ],
        ),
      ),
      drawer: const DrawerDesign(),
    );
  }
}
