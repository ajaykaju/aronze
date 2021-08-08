import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:aronze/widgets/Drawer.dart';
import 'package:aronze/widgets/FavCard.dart';
import 'package:aronze/widgets/FavCardLoader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';

class FavList extends StatefulWidget {
  const FavList({Key? key}) : super(key: key);

  @override
  _FavListState createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ///Header
              Row(
                children: [
                  Icon(CustomIcons.bag2),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Your WishList!",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              ///FavList
              FutureBuilder(
                future: Future.delayed(
                  Duration(
                    seconds: 5,
                  ),
                ),
                builder: (context, snpapShot) {
                  if (snpapShot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          FavCardLoader(),
                          SizedBox(
                            height: 20,
                          ),
                          FavCardLoader(),
                        ],
                      ),
                    );
                  }
                  return Column(
                    children: [
                      FavCard(),
                      SizedBox(
                        height: 20,
                      ),
                      FavCard(),
                    ],
                  );
                },
              )
            ],
          ),
          // child: FutureBuilder(
          //   future: Future.delayed(Duration(seconds: 5)),
          //   builder: (context, snpapShot) {
          //     if (snpapShot.connectionState == ConnectionState.waiting) {
          //       return Container(
          //         width: MediaQuery.of(context).size.width,
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Icon(CustomIcons.bag2),
          //                 Padding(
          //                   padding: const EdgeInsets.only(left: 10.0),
          //                   child: Text(
          //                     "Your WishList!",
          //                     style: TextStyle(
          //                       fontSize: 20.0,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 20,
          //             ),
          //             FavCardLoader(),
          //             SizedBox(
          //               height: 20,
          //             ),
          //             FavCardLoader(),
          //           ],
          //         ),
          //       );
          //     }
          //     return Column(
          //       children: [
          //         ///Header
          //         Row(
          //           children: [
          //             Icon(CustomIcons.bag2),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10.0),
          //               child: Text(
          //                 "Your WishList!",
          //                 style: TextStyle(
          //                   fontSize: 20.0,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           height: 20,
          //         ),
          //         FavCard(),
          //         SizedBox(
          //           height: 20,
          //         ),
          //         FavCard()
          //       ],
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
