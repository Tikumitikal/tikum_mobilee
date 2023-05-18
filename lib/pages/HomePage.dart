import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/CategoriesWidget.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/ItemsWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        HomeAppBar(),
        Container(
          // temporary height
          //height: 500,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: Color.fromRGBO(206, 228, 232, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )),
          child: Column(children: [
            // search widget
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search here...",
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.camera_alt,
                    size: 27,
                    color: Color.fromRGBO(5, 90, 105, 1.000),
                  )
                ],
              ),
            ),

            // container
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(5, 90, 105, 1.000),
                ),
              ),
            ),

            // categories widget
            CategoriesWidget(),

            // items
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                "Best Selling",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(5, 90, 105, 1.000)),
              ),
            ),

            // items widget
            ItemsWidget(),
          ]),
        )
      ]),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 70,
        color: Color.fromRGBO(5, 90, 105, 1.000),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
