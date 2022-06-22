import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealapp/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData.dark(),
      home: const CategoriesScreen(),
    );
  }
}
