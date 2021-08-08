import 'package:aronze/Transitions/SlideTransitions.dart';
import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:aronze/pages/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          SlideFromBottomRoute(page: Product()),
        );
      },
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black12.withOpacity(0.1),
          //       blurRadius: 2.0,
          //       spreadRadius: 2.0)
          // ],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.0,
            color: Colors.blueGrey.shade50,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Image and Fav
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color: Colors.blueGrey.shade50,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Stack(
                  children: [
                    ///Image
                    Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        "https://aronze.in/product-images/60bc7b3a15e1e6ac02e14c78_2.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),

                    ///Fav
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Material(
                        type: MaterialType.transparency,
                        child: ChangeNotifierProvider(
                            create: (BuildContext context) => PFavChanger(),
                            builder: (context, child) => InkWell(
                                  onTap: () {
                                    var fav = context.read<PFavChanger>();
                                    fav.isFaveChanger();
                                  },
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Consumer(
                                    builder:
                                        (context, PFavChanger fav, child) =>
                                            fav.isFav
                                                ? Icon(
                                                    CustomIcons.fav_filled,
                                                    size: 25.0,
                                                    color: Color.fromRGBO(
                                                        203, 61, 61, 1),
                                                  )
                                                : Icon(
                                                    CustomIcons.fav_outline,
                                                    size: 25.0,
                                                    color: Colors.black38,
                                                  ),
                                  ),
                                )),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///Title
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Realme Headphone",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 15.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                height: 40,
              ),
            ),

            ///Price
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8.0),
                  child: Text(
                    "₹599",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PFavChanger extends ChangeNotifier {
  bool isFav = false;
  isFaveChanger() {
    isFav = !isFav;
    notifyListeners();
  }
}
