import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListLoader extends StatefulWidget {
  const ListLoader({Key? key}) : super(key: key);

  @override
  _ListLoaderState createState() => _ListLoaderState();
}

class _ListLoaderState extends State<ListLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.blueGrey.withOpacity(0.1),
            highlightColor: Colors.blueGrey.withOpacity(0.05),
            child: Container(
              height: 180.0,
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
              height: 60.0,
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
      ),
    );
  }
}
