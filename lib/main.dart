import 'package:aronze/Auth/Verification.dart';
import 'package:aronze/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Auth/Auth.dart';
import 'globals.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/aronze_logo_tb.jpg"), context);
    precacheImage(AssetImage("assets/images/contact_image.png"), context);
    precacheImage(AssetImage("assets/images/no-image.png"), context);
    precacheImage(AssetImage("assets/images/notifications.png"), context);
    precacheImage(AssetImage("assets/images/signup_image.png"), context);
    precacheImage(AssetImage("assets/images/verification_image.png"), context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationBarIndex()),
      ],
      builder: (context, child) => MaterialApp(
        home: Routes(),
        builder: (context, child) {
          return ScrollConfiguration(behavior: MyBehaviour(), child: child!);
        },
        theme: ThemeData(primarySwatch: Colors.deepOrange),
      ),
    );
  }
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    // TODO: implement buildOverscrollIndicator
    return super.buildOverscrollIndicator(context, child, details);
  }
}
