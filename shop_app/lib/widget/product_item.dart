import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_details_Screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
// final String id;
// final String title;
// final String imageUrl;

//   const ProductItem(this.id, this.title, this.imageUrl);


  @override
  Widget build(BuildContext context) {
 final product= Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
          child: GridTile(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailScreen.routedNamed, arguments:product.id);
          },
                  child: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(product.isFavorite? Icons.favorite:Icons.favorite_border),
              onPressed: (){
                product.toggleFavoriteStatus();
              },
               color: Theme.of(context).accentColor,
            ),
            title: Text(
              product.title, 
            textAlign: TextAlign.center,
            ), 
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){},
              color: Theme.of(context).accentColor,
            ),
            ),
        ),
      ),
    );
  }
}