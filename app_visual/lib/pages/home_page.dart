import 'package:app_visual/core/flutter_icons.dart';
import 'package:app_visual/widget/app_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../core/consts.dart';
import '../models/food_models.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodModel> foodList = FoodModel.list;
  PageController pageController = PageController(viewportFraction: .8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 60),
                child: _buildRightSection(),
              ),
              Container(
                color: AppColors.greenColor,
                height: MediaQuery.of(context).size.height,
                width: 60,
                padding: EdgeInsets.only(top: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.indiepasion.com/wp-content/uploads/2019/01/John-Doe.jpg'))),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.white),
                      child: Center(
                        child: Icon(FlutterIcons.more_vert),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Transform.rotate(
                  angle: -math.pi / 2,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _buildMenu('Vegetables'),
                          _buildMenu('Chicken'),
                          _buildMenu('Beef'),
                          _buildMenu('Thai')
                        ],
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        margin: EdgeInsets.only(left: 0),
                        width: 156,
                        height: 75,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ClipPath(
                                clipper: AppClipper(),
                                child: Container(
                                  width: 150,
                                  height: 60,
                                  color: AppColors.greenColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Transform.rotate(
                                angle: math.pi / 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Icon(
                                    FlutterIcons.opencart,
                                    size: 16,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _buildMenu(String menu) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 150,
          padding: EdgeInsets.only(top: 16),
          child: Center(
            child: Text(
              menu,
              style: TextStyle(fontSize: 18),
            ),
          )),
    );
  }

  Padding _buildRightSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          _customAppBar(),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 330,
                  child: PageView.builder(
                    controller: pageController,
                    physics: BouncingScrollPhysics(),
                    itemCount: foodList.length,
                    itemBuilder: (ctx, index) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Stack(
                        children: <Widget>[
                          _buildBackground(index),
                          Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.all(
                                      //     Radius.circular(20)),
                                      shape: BoxShape.circle,
                                      // boxShadow: <BoxShadow>[
                                      //   BoxShadow(
                                      //       color: Colors.black54,
                                      //       blurRadius: 1.0,
                                      //       spreadRadius: 1,
                                      //       offset: Offset(0.7, 0.0))
                                      // ],
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              foodList[index].imgPath))))),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.redColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Text(
                                "\$${foodList[index].price}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    'Popular',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
                _buildPopularList()
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildBackground(int index) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 20, right: 50),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.all(Radius.circular(32))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SizedBox(),
          ),
          Row(
            children: <Widget>[
              RatingBar(
                initialRating: 3,
                itemSize: 16,
                minRating: 1,
                direction: Axis.horizontal,
                unratedColor: Colors.black12,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "(120 reviews)",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          Text(
            "${foodList[index].name}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget _buildPopularList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: foodList.length,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(left: 40, bottom: 16, top: 20),
      itemBuilder: (ctx, index) => Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12))),
        child: Row(
          children: <Widget>[
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(foodList[index].imgPath)))),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${foodList[index].name}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(children: <Widget>[
                  Text(
                    "\$${foodList[index].price.toInt()}",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.redColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "${foodList[index].weight.toInt()} go weight",
                    style: TextStyle(fontSize: 12),
                  )
                ])
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
                text: "Hello \n",
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: 'Jhon Doe',
                      style: TextStyle(
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.bold,
                          height: 1.5))
                ]),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: AppColors.greenLightColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search"),
                    ),
                  ),
                  Icon(FlutterIcons.search)
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Center(
              child: Icon(FlutterIcons.shopping_bag),
            ),
          )
        ],
      ),
    );
  }
}
