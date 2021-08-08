import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);

  final List<String> notificationList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
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
                        "Notifications",
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

                ///Notifications
                FutureBuilder(
                    future: Future.delayed(Duration(seconds: 2)),
                    builder: (context, snapShot) {
                      if (snapShot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.separated(
                              itemBuilder: (context, index) => ListTile(
                                    leading: Icon(Icons.arrow_right),
                                    title: Shimmer.fromColors(
                                      baseColor:
                                          Colors.blueGrey.withOpacity(0.1),
                                      highlightColor:
                                          Colors.blueGrey.withOpacity(0.05),
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                      ),
                                    ),
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 8,
                                  ),
                              itemCount: 5),
                        );
                      }
                      if (notificationList.length > 0) {
                        ///If length
                        return Column(
                          children: notificationList
                              .asMap()
                              .entries
                              .map(
                                (entry) => ListTile(
                                  leading: Icon(Icons.arrow_right),
                                  title: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        notificationList[entry.key],
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        ///If null
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 120, left: 50, right: 50),
                              child: Image(
                                image: AssetImage(
                                    "assets/images/notifications.png"),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "No notifications yet !",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "Refresh",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.black,
                            )
                          ],
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
