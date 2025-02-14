import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_version2/providers/favorites_provider.dart';
import 'package:meal_app_version2/providers/filters_provider.dart';
import 'package:meal_app_version2/screens/categories.dart';
import 'package:meal_app_version2/screens/filters.dart';
import 'package:meal_app_version2/screens/meals.dart';
import 'package:meal_app_version2/widgets/main_drawer.dart';

const kInitialFilters= {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
 };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabsScreen> {
 int selectedPageIndex = 0;



 

 void selectPage(int index){
  setState(() {
    selectedPageIndex = index;
  });
 }

 void setScreen(String identifier) async {

     Navigator.of(context).pop();
     if(identifier=='Ayarlar'){
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen())
      );
      
      
      
      
     }
     
 } 

  @override
  Widget build(BuildContext context) {
    
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(availableMeals: availableMeals,);
    var  activePageTitle = 'Kategoriler';


    if(selectedPageIndex == 1){
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = Meals(meals: favoriteMeals, );
      activePageTitle = 'Favorileriniz';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
           BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Kategoriler'),
           BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'Favoriler'),
        ],
      ),
    );
  }
}
