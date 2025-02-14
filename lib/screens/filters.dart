import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_version2/providers/filters_provider.dart';
//import 'package:meal_app/screens/tabs.dart';
//import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(FiltersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seçimleriniz'),
      ),
      //drawer: MainDrawer(onSelectScreen: (identifier){
      //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //}),
      body: 
         Column(
          children: [
            SwitchListTile(
                value: activeFilters[Filter.glutenFree]!,
                onChanged: (isChecked) {
                  ref.read(FiltersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
                },
                title: Text(
                  'Glutensiz',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  'Sadece glutensiz tarifler.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.white),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22)),
                SwitchListTile(
                value: activeFilters[Filter.lactoseFree]!,
                onChanged: (isChecked) {
                  ref.read(FiltersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
                },
                title: Text(
                  'Laktozsuz',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  'Sadece laktozsuz tarifler.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.white),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22)),
                SwitchListTile(
                value: activeFilters[Filter.vegetarian]!,
                onChanged: (isChecked) {
                  ref.read(FiltersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
                },
                title: Text(
                  'Vejateryan',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  'Sadece vejetaryen tarifler.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.white),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22)),
                SwitchListTile(
               value: activeFilters[Filter.vegan]!,
                onChanged: (isChecked) {
                  ref.read(FiltersProvider.notifier).setFilter(Filter.vegan, isChecked);
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  'Sadece vegan tarifler.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.white),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22)),
          ],
        ),
      
    );
  }
}
