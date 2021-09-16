import 'package:flutter/material.dart';
import 'package:testapp/models/meal.dart';
import 'package:testapp/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {

  static const routeName = 'category_meals';

  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {


  late String categoryTitle;
  late List<Meal> categorymeals;

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title']!;
    categorymeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeMeal(String Id){
    setState(() {
      categorymeals.removeWhere((element) => element.id == Id);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categorymeals.length,
        itemBuilder:(ctx,index){
          return MealItem(
              imageUrl:categorymeals[index].imageUrl,
            title: categorymeals[index].title,
            affordability: categorymeals[index].affordability,
            complexity: categorymeals[index].complexity,
            duration: categorymeals[index].duration,
            id: categorymeals[index].id,
          );
      },),
    );
  }
}
