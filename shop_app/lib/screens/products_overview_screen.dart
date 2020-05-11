import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widget/badge.dart';
import '../providers/products.dart';
import '../widget/product_grid.dart';
import '../widget/app_drawer.dart';

enum FilterOpcion{
Favorites,
All
}

class ProductOverviewScreen extends StatefulWidget {
 

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFvaorites=false;
  
  
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),

        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOpcion selectValue){
              setState(() {
                if(selectValue==FilterOpcion.Favorites){
                _showOnlyFvaorites=true;
              }else{
                _showOnlyFvaorites=false;
              }
              });
              
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_)=>[
              PopupMenuItem(child:Text('Only Favorites') ,value:FilterOpcion.Favorites,),
              PopupMenuItem(child:Text('Show All') ,value: FilterOpcion.All,),

            ],
            ),
           Consumer<Cart>(
             builder: (_, cart,ch)=>Badge(
               child:ch,
                value:cart.itemCount.toString() 
             ),
              child: IconButton(
                icon:Icon(Icons.shopping_cart), 
                onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                )
                
                )
      
            
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFvaorites),
    );
  }
}

