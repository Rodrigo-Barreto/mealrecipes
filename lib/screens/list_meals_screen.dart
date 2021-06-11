import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';
import '../components/meals_item.dart';

class ListMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(category.id);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(category.title),
        ),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              meal: categoryMeals[index],
            );
          },
        ));
  }
}
