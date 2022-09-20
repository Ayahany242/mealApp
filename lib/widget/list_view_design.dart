import 'package:flutter/material.dart';

class ListViewDesign extends StatelessWidget {
  final List data;
  final String dataName;
  const ListViewDesign({
    Key? key,
    required this.data,
    required this.dataName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder( //to build ListViewTo Steps & ingredients depend on the dataName
      itemBuilder: (context, index) {
        return dataName == 'ingredients'
            ? cardBuilder(index)
            : listTileBuilder(index);
      },
      itemCount: data.length,
    );
  }
  //to build items in ListView of 'Steps'
  Column listTileBuilder(int index) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(//Circle Widget
            child: Text('#${index + 1}'),
          ),
          title: Text(
            data[index],
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }

//to build items in ListView of 'ingredients'
  Card cardBuilder(int index) {
    return Card(
        color: Colors.amber,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            data[index],
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ));
  }
}
