
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_version2/models/meal.dart';

class FavoriteMealsNotifier extends  StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFovireStatus(Meal meal){
   final mealIsFavorite = state.contains(meal);

   if(mealIsFavorite){
    state = state.where((m)=> m.id!= meal.id).toList();
    return true;
   }
   else{
    state =[...state, meal];
    return false;
   }

    
  }

}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
  return FavoriteMealsNotifier();
});