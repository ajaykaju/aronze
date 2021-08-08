import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Your Orders",
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
                Column(
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
                      child: FadeInImage(
                        placeholder: AssetImage("assets/images/no-image.png"),
                        image: NetworkImageWithRetry(
                            "https://aronze.in/product-images/60bc7b3a15e1e6ac02e14c78_2.jpg"),
                      ),
                    ),

                    ///Title and Price
                    Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(10.0),
                        //   bottomRight: Radius.circular(10.0),
                        // ),
                        color: Colors.blueAccent.withOpacity(0.05),
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
                              width: 3,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              color: Color.fromRGBO(236, 152, 26, 1),
                              child: Text("View Details"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
