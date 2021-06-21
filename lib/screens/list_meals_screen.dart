import 'package:flutter/material.dart';
import '../models/category.dart';
import '../components/meals_item.dart';
import '../models/meal.dart';

class ListMealsScreen extends StatelessWidget {
  final List<Meal> dummyMeals;

  ListMealsScreen(this.dummyMeals);
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = dummyMeals.where((element) {
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
