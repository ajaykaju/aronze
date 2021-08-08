import 'package:aronze/Transitions/SlideTransitions.dart';
import 'package:aronze/pages/cart.dart';
import 'package:aronze/pages/favourites.dart';
import 'package:aronze/pages/home.dart';
import 'package:aronze/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:aronze/custom_widgets/SalamonCustomBottomBar.dart';
import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:provider/provider.dart';

import '../globals.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, BottomNavigationBarIndex indexer, child) =>
          SalomonCustomBottomBar(
        currentIndex: indexer.currentIndex,
        onTap: (i) {

          if(i == 1) {
            Navigator.of(context).push(SlideFromBottomRoute(page: Cart()));
          } else {
            context.read<BottomNavigationBarIndex>().indexChanger(i);
          }

        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.5),
        items: [
          /// Home
          SalomonCustomBottomBarItem(
            icon: Icon(CustomIcons.home),
            title: Text("Home"),
          ),

          /// Cart
          SalomonCustomBottomBarItem(
            // icon: Icon(Icons.shopping_cart_outlined),
            icon: Icon(CustomIcons.cart),
            title: Text("Cart"),
          ),

          /// Fav
          SalomonCustomBottomBarItem(
            icon: Icon(CustomIcons.fav),
            title: Text("Favourite"),
          ),

          /// Profile
          SalomonCustomBottomBarItem(
            icon: Icon(CustomIcons.user),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
