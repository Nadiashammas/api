import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealapp/recipe.api.dart';
import 'package:mealapp/recipe.dart';

import 'category_meal_screen.dart';

class RecipeDetails extends StatefulWidget {
  var i;

  RecipeDetails(this.i);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
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
        title: Text(
          'Recipe Details',
          style: TextStyle(fontFamily: '28DaysLater', fontSize: 40),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    _recipes[widget.i].images,
                    width: Get.width,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  _recipes[widget.i].name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  _recipes[widget.i].preparationSteps,
                  style: TextStyle(fontSize: 14),
                ),
              ]),
            ),
    );
  }
}
