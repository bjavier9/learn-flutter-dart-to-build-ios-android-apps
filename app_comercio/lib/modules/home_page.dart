import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/cuisine_items_card.dart';
import '../components/home_title.dart';
import '../components/nearby_items_card.dart';
import '../components/popular_items_card.dart';
import '../models/cuisineItems.dart';
import '../models/nearbyItems.dart';
import '../models/popularItems.dart';

class HomePage extends StatelessWidget {
  final List<CuisineItems> cuisineItems = [
    CuisineItems(
        text: "Soga de saltar",
        secondaryText: "28 reviews",
        image: "https://mirfitness.com.ar/wp-content/uploads/2343-1.jpg"),
    CuisineItems(
        text: "Ropa deportiva",
        secondaryText: "26 reviews",
        image:
            "https://www.lanetanoticias.com/wp-content/uploads/2020/04/Captura-de-pantalla-2020-04-29-a-las-7.45.41-a.m..png"),
    CuisineItems(
        text: "Traje baño",
        secondaryText: "31 reviews",
        image:
            "https://st1.uvnimg.com/08/50/7c5970e84949b41670555ad98ccd/lana-rhoades-42.jpeg"),
  ];
  final List<PopularItems> popularItems = [
    PopularItems(
        text: "Hermoso bestido negro",
        image:
            "https://i.pinimg.com/564x/9a/f6/16/9af6162e95cd1ee3b0f6ab62414ab024.jpg"),
    PopularItems(
        text: "Bestido formal",
        image:
            "https://lh3.googleusercontent.com/proxy/bJIdonBYOKDo_psRlwAcXOSnaLrKj8E8AfyXHO4sswiYa057wcJkxqTAzvnirXxi2T6sbh7xSHKH_42-bpBgTNhgNKnEk7DG1HxWRJEw8AE4B69qAo_xNvcKqG0N-w"),
  ];
  final List<NearByItems> nearbyItems = [
    NearByItems(
        text: "Bestido con escarcha",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/2/26/Alexis_Texas_2017.jpg"),
    NearByItems(
        text: "Blusa color gris",
        image:
            "https://i.pinimg.com/originals/26/7f/f3/267ff33c46de3df9c51e5163e91b6c85.jpg"),
    NearByItems(
        text: "Polo fila",
        image:
            "https://www.diariolibre.com/binrepository/547x547/0c74/546d350/none/10904/YEBT/95378022-525829691447192-6546335977445510886-n_13806885_20200503102026.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: EdgeInsets.all(8),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            HomeTitle(text: "Recomendado"),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: cuisineItems.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CuisineItemsCard(cuisineItems: cuisineItems[index]);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            HomeTitle(text: "Popular"),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: popularItems.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return PopularItemsCard(popularItems: popularItems[index]);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            HomeTitle(text: "Nearby"),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
              itemCount: nearbyItems.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NearByItemsCard(nearByItems: nearbyItems[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
