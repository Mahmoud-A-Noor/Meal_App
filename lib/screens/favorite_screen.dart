import 'package:flutter/material.dart';
import 'package:testapp/models/meal.dart';
import 'package:testapp/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);


  @override
  Widget build(BuildContext context) {

    if(favoriteMeals.isEmpty){
      return Center(
        child: Text("You Have No Favorite yet.....Start Adding Some"),
      );
    }else{
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder:(ctx,index){
          return MealItem(
            imageUrl:favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
            id: favoriteMeals[index].id,
          );
        },
      );
    }

  }
}
