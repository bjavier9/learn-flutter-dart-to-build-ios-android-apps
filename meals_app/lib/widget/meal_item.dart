import 'package:flutter/material.dart';
import '../screens/meal_detail.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
final String id;
final String title;
final String imageUrl;
final int duration;
final Complexity complexity;
final Affordability affordability;
// final Function removeItem;

  const MealItem({
 @required this.title, 
 @required this.imageUrl, 
 @required this.duration, 
 @required this.complexity, 
 @required this.affordability, 
 @required this.id,
//  @required this.removeItem
 });
 String get complexityText{
   switch(complexity){
     case Complexity.Simple:
      return 'Simple';
      break;
    case Complexity.Challenging:
      return 'Challenging';
      break;
    case Complexity.Hard:
      return 'Hard';
      break;
    default:
      return'Unknowh';
   }
 }
  String get affordabilityText{
   switch(affordability){
     case Affordability.Affordable:
      return 'Affordable';
      break;
    case Affordability.Luxurious:
      return 'Luxurious';
      break;
    case Affordability.Pricey:
      return 'Pricey';
      break;
    default:
      return'Unknowh';
   }
 }

void selectMeal(BuildContext context){
  Navigator.of(context).pushNamed(
    MealDetailScreen.routeName, 
    arguments: id
    ).then((res){
      if(res!=null){
        // removeItem(res);
      }
      
    });
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>selectMeal(context) ,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15)
        ),
        elevation: 4,
        margin:const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight:Radius.circular(15)
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical:5,
                    horizontal: 20
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ItemMenuMeal(icono: Icons.schedule, info:'$duration min'),
                ItemMenuMeal(icono: Icons.work, info:complexityText),
                ItemMenuMeal(icono: Icons.attach_money, info:affordabilityText)


              ],
            ),
          )

        ],),
      ),
    );
  }
}

class ItemMenuMeal extends StatelessWidget {
  final IconData icono;
  final String info;
  const ItemMenuMeal({
    @required  this.icono, 
    @required this.info,
  });


  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Icon(icono),
      SizedBox(width: 6,),
      Text(info)
    ],);
  }
}