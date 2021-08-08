import 'package:aronze/Transitions/SlideTransitions.dart';
import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;
  int _selectedIndex = 0;

  late CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
    _carouselController = CarouselController();
  }

  final List<String> imageList = [
    "https://aronze.in/product-images/60bc7b3a15e1e6ac02e14c78_2.jpg",
    "https://aronze.in/product-images/60bc7b3a15e1e6ac02e14c78_3.jpg",
    "https://aronze.in/product-images/60bc7b3a15e1e6ac02e14c78_5.jpg",
  ];

  List<Widget> productImages() {
    List<Widget> _list = [];
    for (int i = 0; i < imageList.length; i++) {
      _list.add(
        Container(
          child: FadeInImage(
            placeholder: AssetImage("assets/images/no-image.png"),
            image: NetworkImageWithRetry(imageList[i]),
          ),
        ),
      );
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      color: Colors.blueGrey.shade50,
                      height: 500,
                    ),
                    Column(
                      children: [
                        ///Image Carousel and Fav , Cart, Back Button
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            top: 20.0,
                          ),
                          child: Container(
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            child: ChangeNotifierProvider(
                              create: (BuildContext context) => SlideDots(),
                              builder: (context, child) => Stack(
                                children: [
                                  ///Carousel
                                  Align(
                                    alignment: Alignment.center,
                                    child: CarouselSlider(
                                      items: productImages(),
                                      carouselController: _carouselController,
                                      options: CarouselOptions(
                                        height: 350,
                                        viewportFraction: 1.0,
                                        autoPlay: true,
                                        enlargeCenterPage: false,
                                        onPageChanged: (index, reason) {
                                          var carouselIndex =
                                              context.read<SlideDots>();
                                          carouselIndex.indexChanger(index);
                                        },
                                      ),
                                    ),
                                  ),

                                  ///Back and Cart
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ///Back
                                      FloatingActionButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        backgroundColor: Colors.black,
                                        child: Icon(
                                          CustomIcons.left,
                                          color: Colors.white,
                                          size: 15.0,
                                        ),
                                        elevation: 0,
                                      ),

                                      ///Cart
                                      Material(
                                        type: MaterialType.transparency,
                                        child: Ink(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black12,
                                              width: 2.0,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(SlideFromBottomRoute(page: Cart()));
                                            },
                                            borderRadius:
                                                BorderRadius.circular(1000.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(
                                                CustomIcons.bag,
                                                size: 20.0,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  ///Fav
                                  Positioned(
                                    bottom: 10,
                                    right: 0,
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black12,
                                            width: 2.0,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: ChangeNotifierProvider(
                                            create: (BuildContext context) =>
                                                FavChanger(),
                                            builder: (context, child) =>
                                                InkWell(
                                                  onTap: () {
                                                    var fav = context
                                                        .read<FavChanger>();
                                                    fav.isFaveChanger();
                                                  },
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1000),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Consumer(
                                                      builder: (context,
                                                              FavChanger fav,
                                                              child) =>
                                                          fav.isFav
                                                              ? Icon(
                                                                  CustomIcons
                                                                      .fav_filled,
                                                                  size: 20.0,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          203,
                                                                          61,
                                                                          61,
                                                                          1),
                                                                )
                                                              : Icon(
                                                                  CustomIcons
                                                                      .fav_outline,
                                                                  size: 20.0,
                                                                  color: Colors
                                                                      .black87,
                                                                ),
                                                    ),
                                                  ),
                                                )),
                                      ),
                                    ),
                                  ),

                                  ///Carousel Indicator
                                  Positioned(
                                    bottom: 10,
                                    left: 0,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: imageList
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
                                            horizontal: 4,
                                          ),
                                          child: Consumer(
                                            builder: (context, SlideDots slider,
                                                    child) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                  color: slider.carouselIndex ==
                                                          entry.key
                                                      ? Colors.white
                                                      : Colors.transparent,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: slider.carouselIndex ==
                                                        entry.key
                                                    ? const EdgeInsets.all(5.0)
                                                    : const EdgeInsets.all(0),
                                                child: Container(
                                                  height: 6,
                                                  width: 6,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        ///Contents
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///Title and Price
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          "Portronics POR-280 Sound Pot",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "₹599",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                ),

                                ///Availability
                                Row(
                                  children: [
                                    Text(
                                      "Availability : ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),
                                    Text(
                                      "instock",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green,
                                      ),
                                    )
                                  ],
                                ),

                                ///Brand and Model
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  "Brand",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Text(
                                                "SONILEX",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  "Model number",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Text(
                                                "SL-BT-165",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                ///Colour Variants
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Color Variants",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10.0,
                                          left: 20.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Black",
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Blue",
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                ///Description and Specifications
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  child: Container(
                                    child: TabBar(
                                      controller: _tabController,
                                      onTap: (index) {
                                        setState(() {
                                          _selectedIndex = index;
                                        });
                                      },
                                      indicatorColor:
                                          Color.fromRGBO(236, 152, 26, 1),
                                      tabs: [
                                        Tab(
                                          child: Text(
                                            "Description",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Text(
                                            "Specifications",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  child: Container(
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        if (_selectedIndex == 0) {
                                          return Text(
                                            "Bluetooth 5.0 Rich bass stereos sound sweatproof approx 15h backup in-built microphone magnetic absorption light weight sleek design comfortable earbuds",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            textAlign: TextAlign.justify,
                                          );
                                        } else {
                                          return Text(
                                            "Wattage: With a brilliant 3W superior sound output, enjoy the brilliance of pure audio at the tap of a button. In a unique feature, you can also connect the speaker to two different devices at the same time without worrying about connectivity issues. Bluetooth: The portable, lightweight speaker is Bluetooth 4.1-enabled for true wireless connectivity. However, it also supports AUX Port (3.5mm) connectivity, in case you do not want to use Bluetooth. Long-lasting battery: The In-built lithium-ion rechargeable battery provides 7 + hours of non-stop playtime. Its intelligent power-saving design switches off the speaker automatically if not used for more than 10 minutes on waiting mode Ergonomic Design: Constructed in a unique, cylindrical shape for 360-surround sound, so that all areas get an equally loud sound. Also comes with a built-in mic for conferences, making/ receiving calls, etc, ensuring great sound clarity. Additionally, it is IPX6 water-resistant, protected against splashing and light rain.",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            textAlign: TextAlign.justify,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(
                  onPressed: () {},
                  height: 65,
                  elevation: 0.0,
                  splashColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color.fromRGBO(236, 152, 26, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CustomIcons.bag2,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FavChanger extends ChangeNotifier {
  bool isFav = false;
  isFaveChanger() {
    isFav = !isFav;
    notifyListeners();
  }
}

class SlideDots extends ChangeNotifier {
  int carouselIndex = 0;
  indexChanger(int index) {
    carouselIndex = index;
    notifyListeners();
  }
}
