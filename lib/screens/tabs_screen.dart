import 'package:flutter/material.dart';
import 'package:testapp/models/meal.dart';
import 'package:testapp/screens/categories_screen.dart';
import 'package:testapp/screens/favorite_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  late List<Map<String,Object>> pages;

int selectedPageIndex=0;

  void selectScreen(int value) {
    setState(() {
      selectedPageIndex=value;
    });
  }

  @override
  void initState() {
    pages=[
      {
        'page': CategoriesScreen(),
        'title': "categories"
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': "Favorite"
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'] as String),
      ),
        body: pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        onTap: selectScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label:"Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label:"Favorites",
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: MainDrawer(),
    );
  }

}
