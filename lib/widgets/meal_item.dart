import 'package:flutter/material.dart';
import 'package:testapp/models/meal.dart';
import 'package:testapp/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem({
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.id,
  });

  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return "simple";
      case Complexity.Challenging:
        return "challenging";
        default:
          return "Hard";
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "Luxurious";
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
    arguments: id).then((result) {
      //if (result != null) removeItem(result);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical:5,horizontal: 20),
                    color: Colors.black54,
                    width: 300,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 7,),
                      Text('$duration')
                    ]
                  ),
                  Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 7,),
                        Text(complexityText)
                      ]
                  ),
                  Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 7,),
                        Text(affordabilityText)
                      ]
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
