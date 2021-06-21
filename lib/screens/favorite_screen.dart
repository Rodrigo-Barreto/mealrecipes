import 'package:flutter/cupertino.dart';
import '../models/meal.dart';
import '../components/meals_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('No Favorite Meals'),
      );
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, item) {
            return MealItem(meal: favoriteMeals[item]);
          });
    }
  }
}
