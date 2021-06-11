import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../utils/routes_named.dart';
import '../utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem({this.meal});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushPage(context, AppRoutes.Meal_Detail_Screen, meal),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 1,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 20,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 30,
                      ),
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        Text(' ${meal.duration} min '),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        Text(' ${meal.complexityText}')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        Text(' ${meal.costText}'),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
