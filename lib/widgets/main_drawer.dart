import 'package:flutter/material.dart';
import 'package:testapp/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Raleway-Black',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {tapHandler();},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.orangeAccent,
          child: Text(
            "Cooking Up!",
            style: TextStyle(
                fontFamily: 'Raleway-Black',
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.pink),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile("Meal", Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile("Filters", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ],
    ));
  }
}
