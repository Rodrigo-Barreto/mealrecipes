import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Lets Go Kitchen', 'screen': CategoryScreen()},
    {'title': 'Favorites', 'screen': FavoriteScreen()},
  ];

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
