import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/main_drawer.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabScreen( this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;

 
  int _selectPageIndex = 0;
 
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   _pages= [
  {
    'page':CategoriesScreen(),
    'title':'Categories'
  },
  {
    'page':FavoritesScreen(widget.favoriteMeals),
    'title':'Your favorite'
  }
  
  ];
  }
 void _selectPage(int index){
    setState(() {
      _selectPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Caegories')
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites')
            )
          ],
        ),   
    );
  }
}