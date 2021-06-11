import 'package:flutter/material.dart';
import 'package:meals_app/screens/list_meals_screen.dart';
import 'screens/category_screen.dart';
import 'utils/app_routes.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(MealsApp());
}

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 252, 231, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(fontSize: 20),
            ),
      ),
      routes: {
        AppRoutes.Home: (ctx) => TabsScreen(),
        AppRoutes.List_Meals: (ctx) => ListMealsScreen(),
        AppRoutes.Meal_Detail_Screen: (ctx) => MealDetailScreen(),
      },
    );
  }
}
