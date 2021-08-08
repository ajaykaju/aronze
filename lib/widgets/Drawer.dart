import 'package:aronze/Auth/Auth.dart';
import 'package:aronze/Transitions/SlideTransitions.dart';
import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:aronze/pages/Contact.dart';
import 'package:aronze/pages/Orders.dart';
import 'package:aronze/pages/notifications.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black87, Colors.black])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        "assets/images/aronze_logo_tb.jpg",
                        height: 120,
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      CustomIcons.user,
                      color: Colors.white,
                    ),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(SlideFromBottomRoute(page: AuthDecider()));
                    },
                    minLeadingWidth: 20,
                    title: Text(
                      "Login / SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(SlideFromBottomRoute(page: Orders()));
                    },
                    leading: Icon(
                      CustomIcons.bag,
                      color: Colors.white,
                    ),
                    minLeadingWidth: 20,
                    title: Text(
                      "My Orders",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      CustomIcons.products,
                      color: Colors.white,
                    ),
                    minLeadingWidth: 20,
                    title: Text(
                      "All Products",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(SlideFromBottomRoute(page: Notifications()));
                    },
                    leading: Icon(
                      CustomIcons.reminder,
                      color: Colors.white,
                    ),
                    minLeadingWidth: 20,
                    title: Text(
                      "Notifications",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.6),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(SlideFromBottomRoute(page: Contact()));
                    },
                    leading: Icon(
                      CustomIcons.contact,
                      color: Colors.white,
                    ),
                    minLeadingWidth: 20,
                    title: Text(
                      "Contact",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      CustomIcons.policy,
                      color: Colors.white,
                    ),
                    minLeadingWidth: 20,
                    title: Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
