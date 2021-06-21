import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favorteMeals;
  TabsScreen(this.favorteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectScreenIndex = 0;
  List<Map<String, Object>> _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lets Go Kitchen',
        'screen': CategoryScreen(),
      },
      {
        'title': 'Favorites',
        'screen': FavoriteScreen(widget.favorteMeals),
      },
    ];
  }

  _selectScreen(index) {
    setState(() {
      selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[selectScreenIndex]['title']),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _screens[selectScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectScreenIndex,
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
