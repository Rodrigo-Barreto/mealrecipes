import 'package:flutter/material.dart';
import 'package:meals_app/screens/list_meals_screen.dart';
import 'models/meal.dart';
import 'models/settings.dart';
import 'utils/app_routes.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(MealsApp());
}

class MealsApp extends StatefulWidget {
  @override
  _MealsAppState createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Settings settings = Settings();
  List<Meal> _avaibleMeals = DUMMY_MEALS;

  void filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaibleMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactoseFree = settings.isLactoseFree && !meal.isLactoseFree;
        final filterisVegan = settings.isVegan && !meal.isVegan;
        final filterisVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactoseFree &&
            !filterisVegan &&
            !filterisVegetarian;
      }).toList();
    });
  }

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
        AppRoutes.List_Meals: (ctx) => ListMealsScreen(_avaibleMeals),
        AppRoutes.Meal_Detail_Screen: (ctx) => MealDetailScreen(),
        AppRoutes.Settings: (ctx) => SettingsScreen(settings, filterMeals),
      },
    );
  }
}
