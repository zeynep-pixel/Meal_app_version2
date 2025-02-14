import 'package:flutter/material.dart';
import 'package:meal_app_version2/data/dummy_data.dart';
import 'package:meal_app_version2/models/category.dart';
import 'package:meal_app_version2/models/meal.dart';
import 'package:meal_app_version2/screens/meals.dart';
import 'package:meal_app_version2/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key,  required this.availableMeals});
 
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  
  @override
  void initState() {
    super.initState();
    
    animationController = AnimationController(vsync: this,
    duration: const Duration(milliseconds: 300),
    lowerBound: 0, // 0 as default, dont have to code
    upperBound: 1, // 1 as default, dont have to code 
    );


    animationController.forward();
      }


    @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category){
    final filteredmeals = widget.availableMeals.where((meal)=> meal.categories.contains(category.id)).toList();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => Meals(title: category.title, meals: filteredmeals, )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child:  GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          children: [
           for (final category in availableCategories)
           CategoryGridItem(category: category, onTop: () {
             _selectCategory(context,category);
           },)
          ],
        ),
        builder:(context, child)=> SlideTransition(position:Tween(
          begin: const Offset(0,0.3),
          end: const Offset(0, 0)
        
        ).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut)), child: child,));
  }
}
