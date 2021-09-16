import 'package:flutter/material.dart';
import 'package:testapp/screens/categories_screen.dart';
import 'package:testapp/screens/category_meal_screen.dart';
import 'package:testapp/screens/filter_screen.dart';
import 'package:testapp/screens/meal_detail_screen.dart';
import 'package:testapp/screens/tabs_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeal = [];

  void setFilters(Map<String, bool> FilterData) {
    setState(() {
      filters = FilterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten']! && !meal.isGlutenFree) return false;
        if (filters['lactose']! && !meal.isLactoseFree) return false;
        if (filters['vegan']! && !meal.isVegan) return false;
        if (filters['vegetarian']! && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void toggleFavorites(String mealId) {
    final existingIndex = favoriteMeal.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(favoriteMeal),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(toggleFavorites,isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(filters, setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MealApp"),
      ),
      body: CategoriesScreen(),
    );
  }
}
