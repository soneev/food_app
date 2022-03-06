import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './special.dart';

import './display.dart';
import './drawer.dart';
import './login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => drwr()));
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.deepOrange,
                        )),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "Resturant",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 120.0,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_pin,
                          color: Colors.deepOrange,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.deepOrange,
                        )),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginpage()));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ListView(
                    children: [
                      CarouselSlider(
                        items: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //margin: EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                image: AssetImage("asset/caru/bunbrg.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                image: AssetImage("asset/caru/burgerk.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Screen(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                image: AssetImage("asset/caru/offdtl.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 180.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.easeInOutBack,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    child: SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        )),
                        // Icon(Icons.menu_open_sharp)

                        IconButton(
                            splashColor: Colors.red,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewArrivals()),
                              );
                            },
                            icon: Image.asset("asset/menu.png",
                                height: 20,
                                width: 20,
                                color: Colors.deepOrange[800])),
                      ],
                    )
                  ]),
                )),
                Container(
                  height: 115,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listcards.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return categorycard(
                        categoryModel: listcards[index],
                      );
                    },
                  ),
                ),
                Spcial(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class categorycard extends StatelessWidget {
  final CategoryModel categoryModel;
  categorycard({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(17),
          margin: EdgeInsets.only(top: 5, bottom: 2, right: 5, left: 8),
          height: 70,
          width: 70,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 2,
              blurRadius: 2,
            )
          ], color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
          child: Image.asset(categoryModel.imageUrl),
        ),
        Text(categoryModel.title),
      ],
    );
  }
}

class CategoryModel {
  String imageUrl;
  String title;
  String? remoteUrl;
  CategoryModel(this.imageUrl, this.title, {this.remoteUrl});
}

List<CategoryModel> listcards = [
  CategoryModel("asset/starters.png", "Starters"),
  CategoryModel("asset/soup.png", "Soups"),
  CategoryModel("asset/sndwch.png", "Sandvich"),
  CategoryModel("asset/pizza.png", "pizza"),
  CategoryModel("asset/ndls.png", "noodls"),
  CategoryModel("asset/brgr.png", "burger"),
  CategoryModel("asset/dosa.png", "dosa"),
  CategoryModel("asset/icecream.png", "ice-cream"),
  CategoryModel("asset/poinsettia.png", "poinsettia"),
];
