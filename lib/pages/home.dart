import 'package:aronze/Transitions/SlideTransitions.dart';
import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:aronze/pages/notifications.dart';
import 'package:aronze/pages/routes.dart';
import 'package:aronze/widgets/BottomNavigationBar.dart';
import 'package:aronze/widgets/Drawer.dart';
import 'package:aronze/widgets/ListLoader.dart';
import 'package:aronze/widgets/ProductCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final List<String> categories = [
  //   "All",
  //   "Headphones",
  //   "Food Kit",
  //   "Tablet",
  //   "Mobiles",
  //   "Chargers"
  // ];


  final List<String> images = [
    "https://aronze.in/images/Banner2.jpg",
    "https://aronze.in/images/Banner3.jpg",
    "https://aronze.in/images/Banner1.jpg"
  ];

  final List<String> brands = [
    "https://aronze.in/images/5ff2b0c353bb2b259ee86f46.jpg",
    "https://aronze.in/images/5ff2b10053bb2b259ee86f47.jpg",
    "https://aronze.in/images/5ff2b13253bb2b259ee86f48.jpg",
    "https://aronze.in/images/5ff2d42a53bb2b259ee86f49.jpg",
    "https://aronze.in/images/5ff2d47453bb2b259ee86f4a.jpg",
    "https://aronze.in/images/5ff2d4c253bb2b259ee86f4b.jpg"
  ];

  // Widget categoryWidget(BuildContext context, String text) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Color.fromRGBO(236, 152, 26, 0.2),
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: 20.0,
  //         vertical: 10.0,
  //       ),
  //       child: Center(
  //         child: Text(
  //           text,
  //           style: TextStyle(
  //             color: Color.fromRGBO(236, 152, 26, 1),
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget getCategoriesList() {
  //   return ListView.builder(
  //     itemCount: categories.length,
  //     // separatorBuilder: (BuildContext context, index) => SizedBox(
  //     //   width: 5.0,
  //     // ),
  //     scrollDirection: Axis.horizontal,
  //     itemBuilder: (BuildContext context, index) {
  //       return Padding(
  //         padding: EdgeInsets.only(left: 8.0, right: 8.0),
  //         child: categoryWidget(context, categories[index]),
  //       );
  //     },
  //   );
  // }

  Widget carouselContainer(int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          images[index],
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  List<Widget> getCarouselContainers() {
    List<Widget> containerList = [];
    for (int i = 0; i < images.length; i++) {
      containerList.add(carouselContainer(i));
    }
    return containerList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///App Bar Top
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            backgroundColor: Colors.black,
                            child: Icon(CustomIcons.menu_doted),
                            elevation: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Aronze",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 2.0),
                                  shape: BoxShape.circle),
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(1000.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    CustomIcons.search,
                                    size: 20.0,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Material(
                            type: MaterialType.transparency,
                            child: Ink(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 2.0,
                                  ),
                                  shape: BoxShape.circle),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    SlideFromBottomRoute(page: Notifications()),
                                  );
                                },
                                borderRadius: BorderRadius.circular(1000.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    CustomIcons.reminder,
                                    size: 20.0,
                                    color: Colors.black87,
                                  ),
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

              ///Categories
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 20.0,
              //     bottom: 20.0,
              //   ),
              //   child: Container(
              //     height: 45,
              //     child: getCategoriesList(),
              //   ),
              // ),

              ///Slider
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: FutureBuilder(
                  future: Future.delayed(
                    Duration(seconds: 3),
                  ),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                        baseColor: Colors.blueGrey.withOpacity(0.1),
                        highlightColor: Colors.blueGrey.withOpacity(0.05),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    return CarouselSlider(
                      items: getCarouselContainers(),
                      options: CarouselOptions(
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        height: 200.0,
                        enlargeCenterPage: true,
                      ),
                    );
                  },
                ),
              ),

              ///Featured List
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Featured Products",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      "Based on most recent items",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  height: 260.0,
                  child: FutureBuilder(
                      future: Future.delayed(
                        Duration(seconds: 3),
                      ),
                      builder: (context, snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ListLoader(),
                              SizedBox(
                                width: 10,
                              ),
                              ListLoader(),
                            ],
                          );
                        }
                        return ListView.separated(
                          itemCount: 8,
                          separatorBuilder: (BuildContext context, index) =>
                              SizedBox(
                            width: 10.0,
                          ),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return ProductCard();
                          },
                        );
                      }),
                ),
              ),

              ///Top List
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Top Collection",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.0),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black38),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  height: 260.0,
                  child: FutureBuilder(
                      future: Future.delayed(
                        Duration(seconds: 3),
                      ),
                      builder: (context, snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ListLoader(),
                              SizedBox(
                                width: 10,
                              ),
                              ListLoader(),
                            ],
                          );
                        }
                        return ListView.separated(
                          itemCount: 8,
                          separatorBuilder: (BuildContext context, index) =>
                              SizedBox(
                            width: 10.0,
                          ),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return ProductCard();
                          },
                        );
                      }),
                ),
              ),

              ///Brands
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Brands",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.0),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black38),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  height: 100.0,
                  child: FutureBuilder(
                      future: Future.delayed(
                        Duration(seconds: 3),
                      ),
                      builder: (context, snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.blueGrey.withOpacity(0.1),
                                highlightColor:
                                Colors.blueGrey.withOpacity(0.05),
                                child: Container(
                                  width: 200,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.blueGrey.withOpacity(0.1),
                                highlightColor:
                                    Colors.blueGrey.withOpacity(0.05),
                                child: Container(
                                  width: 200,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        }
                        return ListView.separated(
                          itemCount: brands.length,
                          separatorBuilder: (BuildContext context, index) =>
                              SizedBox(
                            width: 10.0,
                          ),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              width: 200,
                              child: Image.network(brands[index]),
                            );
                          },
                        );
                      }),
                ),
              ),

              ///Bottom Gap
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
