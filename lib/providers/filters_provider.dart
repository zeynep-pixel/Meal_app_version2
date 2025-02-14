import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_version2/providers/meals_provider.dart';

enum Filter{
 glutenFree,
 lactoseFree,
 vegetarian,
 vegan
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>>{
  FiltersNotifier(): super({
    Filter.glutenFree : false,
    Filter.lactoseFree : false,
    Filter.vegetarian : false,
    Filter.vegan : false,
  });

  void setFilters(Map<Filter, bool> chosenFilters ){
    state = chosenFilters;
   }
   
   void setFilter(Filter filter, bool isActive){
   state = {
     ...state,
     filter: isActive
   };
   }

}

final FiltersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter,bool>>((ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref){
     final meal = ref.watch(mealsProvider);
     final  selectedFilters = ref.watch(FiltersProvider);
     return meal.where((meal){
      if(selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();});