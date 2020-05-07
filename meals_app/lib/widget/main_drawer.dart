import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),
          SizedBox(
            height: 20,
          ),
          ListOption(
            icon: Icons.restaurant,
            titulo: 'Meals',
            handlerFunction: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListOption(
            icon: Icons.settings,
            titulo: 'Filters',
            handlerFunction: () {
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}

class ListOption extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final Function handlerFunction;
  const ListOption({
    Key key,
    this.icon,
    this.titulo,
    this.handlerFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: handlerFunction,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        titulo,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
