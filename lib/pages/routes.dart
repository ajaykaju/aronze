import 'package:aronze/Transitions/SlideTransitions.dart';
import 'package:aronze/pages/cart.dart';
import 'package:aronze/pages/favourites.dart';
import 'package:aronze/pages/home.dart';
import 'package:aronze/pages/profile.dart';
import 'package:aronze/widgets/BottomNavigationBar.dart';
import 'package:aronze/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../globals.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(),
      body: SafeArea(
        child: Consumer(
          builder: (context, BottomNavigationBarIndex indexer, child) {
            Widget child;

            if (indexer.currentIndex == 2)
              child = FavList();
            else if (indexer.currentIndex == 3)
              child = Profile();
            else
              child = Home();
            return Container(
              child: child,
            );
          },
        ),
      ),
    );
  }
}
