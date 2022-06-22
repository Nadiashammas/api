import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mealapp/recipe.api.dart';
import 'package:mealapp/recipe.dart';
import 'package:mealapp/recipe_card.dart';

import 'package:get/get.dart';
import 'package:mealapp/recipe_details.dart';

class CategoryMealScreen extends StatefulWidget {
  final String id;
  final String title;

  CategoryMealScreen(this.id, this.title);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title,
              style: TextStyle(fontFamily: '28DaysLater', fontSize: 35)),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: RecipeCard(
                        title: _recipes[index].name,
                        cookTime: _recipes[index].totalTime,
                        rating: _recipes[index].rating.toString(),
                        thumbnailUrl: _recipes[index].images),
                    onTap: () {
                      Get.to(RecipeDetails(index));
                    },
                  );
                },
              ));
  }
}
