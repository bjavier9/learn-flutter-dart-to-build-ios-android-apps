import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import './providers/auth.dart';
import './screens/edit_product_screen.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './providers/cart.dart';
import './screens/product_details_Screen.dart';
import './screens/auth_screen.dart';
import './screens/cart_screen.dart';
import './providers/products.dart';
import './screens/user_products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousItems) => Products(auth.token,
              previousItems == null ? [] : previousItems.items, auth.userId),
          create: (_) => Products('', [], ''),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousItems) => Orders(
              auth.token, previousItems == null ? [] : previousItems.orders),
          create: (_) => Orders('', []),
        )
      ],
      child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'MyShop',
                theme: ThemeData(
                    primaryColor: Colors.purple,
                    accentColor: Colors.deepOrange,
                    fontFamily: 'Lato'),
                home: auth.isAuth ? ProductOverviewScreen() : AuthScreen(),
                routes: {
                  ProductDetailScreen.routedNamed: (ctx) =>
                      ProductDetailScreen(),
                  CartScreen.routeName: (ctx) => CartScreen(),
                  OrdersScreen.routeName: (ctx) => OrdersScreen(),
                  UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
                  EditProductScreen.routeNane: (ctx) => EditProductScreen()
                },
              )),
    );
  }
}
