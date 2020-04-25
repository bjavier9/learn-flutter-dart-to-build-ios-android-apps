import 'package:flutter/material.dart';

class BarApp extends StatelessWidget implements PreferredSizeWidget {
 
  @override
  Widget build(BuildContext context) {
    return  AppBar(
        automaticallyImplyLeading: false,
       flexibleSpace: Container(
          decoration:BoxDecoration(
            gradient:LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Flutter Assignment",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Max",
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
        actions: <Widget>[
           Container(
          padding: EdgeInsets.all(5.0),
           child: CircleAvatar(
             backgroundImage: NetworkImage('https://i.udemycdn.com/user/200_H/13952972_e853.jpg'),
             radius: 25.0,
           )
        )
        ],
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
  return new Size.fromHeight(50.0);
}
}