import 'package:flutter/material.dart';
import 'package:testapp/widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // appBar: AppBar(
    //   title: Text("Meal")
    // ),
    body: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map(
                  (catedata) => CategoryItem(catedata.id, catedata.title, catedata.color)
          ).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )
      ),
    );
  }
}
