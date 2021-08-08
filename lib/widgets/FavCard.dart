import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:provider/provider.dart';

class FavCard extends StatefulWidget {
  const FavCard({Key? key}) : super(key: key);

  @override
  _FavCardState createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {
  late CarouselController _carouselController;

  @override
  void initState() {
    super.initState();

    _carouselController = CarouselController();
  }

  favRemover() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          width: 100,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: 10,
                          ),
                          child: Center(
                            child: Text(
                              "Are you sure to remove this item from your wish list?",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text(
                                "CONFIRM",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.black,
                          // border: Border.all(width: 1.0, color: Colors.blueGrey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Container(
                      width: 40,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 1.0,
          color: Colors.blueGrey.shade50,
        ),
      ),
      child: Column(
        children: [
          ///Carousel
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: Colors.blueGrey.shade50,
            ),
            child: ChangeNotifierProvider(
              create: (BuildContext context) => FavSlideDots(),
              builder: (context, child) => Stack(
                children: [
                  ///Carousel
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: CarouselSlider(
                        items: productImages(),
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          height: 250,
                          viewportFraction: 1.0,
                          autoPlay: true,
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) {
                            var carouselIndex = context.read<FavSlideDots>();
                            carouselIndex.indexChanger(index);
                          },
                        ),
                      ),
                    ),
                  ),

                  ///Fav
                  Positioned(
                    top: 10,
                    right: 10,
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
                            create: (BuildContext context) => FavFavChanger(),
                            builder: (context, child) => InkWell(
                                  onTap: () {
                                    favRemover();
                                    var fav = context.read<FavFavChanger>();
                                    fav.isFaveChanger();
                                  },
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Consumer(
                                      builder:
                                          (context, FavFavChanger fav, child) =>
                                              fav.isFav
                                                  ? Icon(
                                                      CustomIcons.fav_filled,
                                                      size: 20.0,
                                                      color: Color.fromRGBO(
                                                          203, 61, 61, 1),
                                                    )
                                                  : Icon(
                                                      CustomIcons.fav_outline,
                                                      size: 20.0,
                                                      color: Colors.black87,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 4,
                          ),
                          child: Consumer(
                            builder: (context, FavSlideDots slider, child) =>
                                Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: slider.carouselIndex == entry.key
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: slider.carouselIndex == entry.key
                                    ? const EdgeInsets.all(5.0)
                                    : const EdgeInsets.all(0),
                                child: Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
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

          ///Title and Price
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "Portronics POR-280 Sound Pot",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.0,
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
            ),
          ),
        ],
      ),
    );
  }
}

class FavSlideDots extends ChangeNotifier {
  int carouselIndex = 0;
  indexChanger(int index) {
    carouselIndex = index;
    notifyListeners();
  }
}

class FavFavChanger extends ChangeNotifier {
  bool isFav = true;
  isFaveChanger() {
    isFav = !isFav;
    notifyListeners();
  }
}
