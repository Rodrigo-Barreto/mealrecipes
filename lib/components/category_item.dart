import 'package:flutter/material.dart';
import '../models/category.dart';
import '../utils/app_routes.dart';
import '../utils/routes_named.dart';

class CategoryItem extends StatelessWidget {
  @override
  final Category category;

  CategoryItem({this.category});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushPage(context, AppRoutes.List_Meals, category),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        child: Text(category.title),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.centerLeft,
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
          ),
        ),
      ),
    );
  }
}
