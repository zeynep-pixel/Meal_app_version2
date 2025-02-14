import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_version2/models/meal.dart';
import 'package:meal_app_version2/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFovireStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? 'Favorilerden kaldırılıdı.': 'Favorilere eklendi.'
                       )));
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation){
                return RotationTransition(turns: Tween(begin: 0.5, end: 1.0).animate(animation), child: child,);
              },
              child: Icon(isFavorite ? Icons.star : Icons.star_border, key: ValueKey(isFavorite)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: meal.id,
            child: Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text('İçindekiler',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: const Color.fromARGB(255, 170, 88, 88))),
          const SizedBox(
            height: 14,
          ),
          for (final ingredient in meal.ingredients)
            Text(ingredient,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white)),
          const SizedBox(
            height: 24,
          ),
          Text('Adımlar',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: const Color.fromARGB(255, 170, 88, 88))),
          const SizedBox(
            height: 14,
          ),
          for (final steps in meal.steps)
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  steps,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ))
        ]),
      ),
    );
  }
}
