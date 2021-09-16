import 'package:flutter/material.dart';
import 'package:testapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal-detail';

  final Function toggleFavorites;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorites,this.isFavorite);


  Widget buildSectionTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle("Ingredients", context),
          buildContainer(ListView.builder(
            itemCount: selectedMeal.ingredients.length,
            itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                )),
          )),
          buildSectionTitle("Steps", context),
          buildContainer(ListView.builder(
            itemCount: selectedMeal.ingredients.length,
            itemBuilder: (ctx, index) => Column(
              children: [
                ListTile(
                  title: Text(selectedMeal.steps[index]),
                  leading: CircleAvatar(
                    child: Text("# ${index+1} "),
                  ),
                ),
                Divider()
              ],
            )
          )),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>toggleFavorites(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border
        ),
      ),
    );
  }
}
