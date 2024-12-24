import 'package:catalogs_app/screens/armies.dart';
import 'package:catalogs_app/screens/categories.dart';
import 'package:catalogs_app/screens/filters.dart';
import 'package:catalogs_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catalogs_app/providers/favorites_provider.dart';
import 'package:catalogs_app/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.chaos: false,
  Filter.imperial: false,
  Filter.xenos: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableArmies = ref.watch(filteredArmiesProvider);

    Widget activePage = CategoriesScreen(
      availableArmies: availableArmies,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteArmies = ref.watch(favoriteArmiesProvider);
      activePage = ArmiesScreen(
        armie: favoriteArmies,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex:
            _selectedPageIndex, //this controls which tab is highlighted
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
