import 'package:flutter/material.dart';
import 'package:testapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  final Function saveFilter;
  final Map<String,bool> currentFilter;

  FiltersScreen(this.currentFilter,this.saveFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool isGlutenFree=false;
  bool isVegan=false;
  bool isVegetarian=false;
  bool isLactoseFree=false;

  @override
  initState(){
    isGlutenFree=widget.currentFilter['gluten']!;
    isVegan=widget.currentFilter['vegan']!;
    isVegetarian=widget.currentFilter['vegetarian']!;
    isLactoseFree=widget.currentFilter['lactose']!;
    super.initState();
  }

  Widget buildSwitchListTile(String title,String subtitle,bool istrue,Function updateValue)
  {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: istrue,
        onChanged: (newvalue){updateValue(newvalue);}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String,bool> selectedFilters = {
                  'gluten':isGlutenFree,
                  'lactose':isLactoseFree,
                  'vegan':isVegan,
                  'vegetarian':isVegetarian
                };
                widget.saveFilter(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Text("Adjust Your Meal Selection",style: Theme.of(context).textTheme.headline6,),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('GlutenFree',"only include Gluten-free meals",isGlutenFree,(newvalue){
                  setState(() {
                    isGlutenFree=newvalue;
                  });
                }),
                buildSwitchListTile('LactoseFree',"only include Lactose-free meals",isLactoseFree,(newvalue){
                  setState(() {
                    isLactoseFree=newvalue;
                  });
                }),
                buildSwitchListTile('Vegetarian',"only include Vegetarian-free meals",isVegetarian,(newvalue){
                  setState(() {
                    isVegetarian=newvalue;
                  });
                }),
                buildSwitchListTile('Vegan',"only include Vegan-free meals",isVegan,(newvalue){
                  setState(() {
                    isVegan=newvalue;
                  });
                }),
              ],
            ),
          )

        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
