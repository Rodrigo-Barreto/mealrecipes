import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(meal.title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            MealTitleDetail(context, 'Indredients'),
            ContainerMealDetail(
              widget: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Card(
                      color: Theme.of(context).accentColor,
                      child: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(meal.ingredients[index])),
                    ),
                  );
                },
              ),
            ),
            MealTitleDetail(context, 'Steps'),
            ContainerMealDetail(
              widget: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(meal.steps[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container ContainerMealDetail({Widget widget}) {
    return Container(
      width: 350,
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: widget,
    );
  }

  Container MealTitleDetail(BuildContext context, title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
