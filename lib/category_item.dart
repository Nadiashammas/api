import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final Color color;
  final String title;

  CategoryItem(this.color, this.title, this.id);

  void slectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealScreen(id, title);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          if (id == 'c2') {
            slectCategory(context);
          }
        },
        child: Container(
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 25,
                  letterSpacing: 3,
                  //fontWeight: FontWeight.bold,
                  //letterSpacing: 1,
                  // color: Colors.white,
                  fontFamily: '28DaysLater'),
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.5), color],
                  begin: Alignment.center,
                  end: Alignment.topCenter),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
