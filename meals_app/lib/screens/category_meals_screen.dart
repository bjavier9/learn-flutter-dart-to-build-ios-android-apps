import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import '../widget/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
static const String routeName ='/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
String categoryTitle;
List<Meal> displayedMeals;
bool _loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
   
  }

@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(!_loadedInitData){
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId=routeArgs['id'];
    categoryTitle=routeArgs['title'];
    displayedMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
 _loadedInitData=true;
    }
     
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal)=>meal.id ==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body:ListView.builder(
          itemBuilder: (ctx, index){
              return MealItem(
                id: displayedMeals[index].id,
                title:  displayedMeals[index].title,
                duration:  displayedMeals[index].duration,
                affordability:  displayedMeals[index].affordability,
                complexity:  displayedMeals[index].complexity,
                imageUrl:  displayedMeals[index].imageUrl,
                removeItem: _removeMeal,
              );
          },
          itemCount: displayedMeals.length 
        )
    );
  }
}