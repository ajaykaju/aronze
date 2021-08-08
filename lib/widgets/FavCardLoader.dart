import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FavCardLoader extends StatefulWidget {
  const FavCardLoader({Key? key}) : super(key: key);

  @override
  _FavCardLoaderState createState() => _FavCardLoaderState();
}

class _FavCardLoaderState extends State<FavCardLoader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.blueGrey.withOpacity(0.1),
          highlightColor: Colors.blueGrey.withOpacity(0.05),
          child: Container(
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.blueGrey.withOpacity(0.05),
          highlightColor: Colors.blueGrey.withOpacity(0.01),
          child: Container(
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
