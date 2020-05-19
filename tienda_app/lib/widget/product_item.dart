import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../providers/product.dart';
import '../screens/product_details_Screen.dart';
// import '../providers/product.dart';

class ProductItem extends StatelessWidget {
// final String id;
// final String title;
// final String imageUrl;

//   const ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Products>(context, listen: false);
    // print(product);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Hero(
          tag: product.id,
          child: FadeInImage(
            placeholder: AssetImage('assets/images/carga.gif'),
            image: NetworkImage(product.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        footer: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routedNamed,
                arguments: product.id);
          },
          child: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
                builder: (ctx, product, _) => IconButton(
                      icon: Icon(product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () {
                        product.toggleFavoriteStatus(
                            authData.authToken, authData.userId);
                      },
                      color: Theme.of(context).accentColor,
                    )),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Add item to cart'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeItem(product.id);
                    },
                  ),
                ));
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
