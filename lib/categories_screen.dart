import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/category_item.dart';
import 'package:mealapp/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Magazine',
          style: TextStyle(fontFamily: '28DaysLater', fontSize: 40),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: (Icon(Icons.menu)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView(
          children: DUMMY_CATEGORIES
              .map((catData) =>
                  CategoryItem(catData.color, catData.title, catData.id))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 5,
          ),
        ),
      ),
    );
  }
}
