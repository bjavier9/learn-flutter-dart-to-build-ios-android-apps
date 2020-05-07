import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> currentFilters;
  final Function saveFilters;
  

  const FilterScreen(this.currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {


  bool _gluttenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gluttenFree = widget.currentFilters['glutten'];
    _lactoseFree= widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filter'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save),
            onPressed:(){
              final selectedFilters = {
                 'glutten': _gluttenFree,
                 'lactose': _lactoseFree,
                    'vegan': _vegan,
                'vegetarian':_vegetarian
              };


              widget.saveFilters(selectedFilters);
              
              }
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchListTile(
                      'Vegetarian',
                      'Only include Vegetarian meals',
                      _vegetarian, (newValue) {
                    _vegetarian = newValue;
                  }),
                    buildSwitchListTile(
                      'Vegan',
                      'Only include vegan meals',
                      _vegan, (newValue) {
                    _vegan = newValue;
                  }),
                   buildSwitchListTile(
                      'Lactose-Free',
                      'Only include lactose-free meals',
                      _lactoseFree, (newValue) {
                    _lactoseFree = newValue;
                  }),
                  buildSwitchListTile(
                      'Glutten-Free',
                      'Only include Glutten-Free meals',
                      _gluttenFree, (newValue) {
                    _gluttenFree = newValue;
                  })
                ],
              ),
            )
          ],
        ));
  }

  SwitchListTile buildSwitchListTile(String title, String description,
      bool currentValue, Function updateVlue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateVlue,
    );
  }
}
