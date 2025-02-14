import 'package:flutter/material.dart';
import 'package:meal_app_version2/models/meal.dart';
import 'package:meal_app_version2/screens/meal_details.dart';
import 'package:meal_app_version2/widgets/mealItem.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.title, required this.meals, });

  final String? title;
  final List<Meal> meals;


  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen ( meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => Mealitem(
        meal: meals[index],
        onSelectMeal: selectMeal,
      ),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ohh, burada hiçbir şey yok.',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 16,
            ),
            Text('Farklı bir kategory deneyiniz',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground))
          ],
        ),
      );
    }

    if (title== null){
      return content;
    }
    else{
      return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
    }

    
    
  }
}
