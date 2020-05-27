import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//import 'screens/playground_screen.dart';
//import 'screens/details_screen.dart';
//import 'screens/profile_screen.dart';
//import 'screens/homepage.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Embassy',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Altero',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        // PlaygroundScreen.routeName: (BuildContext ctx) =>
        //     PlaygroundScreen(context),
        //DetailsScreen.routeName: (BuildContext ctx) => DetailsScreen(),
        //ProfileScreen.routeName: (BuildContext ctx) => ProfileScreen(),
        //HomePage.routeName: (BuildContext context) => HomePage(),
      },
    );
  }
}

// CHARTS - https://github.com/imaNNeoFighT/fl_chart
// GMAPS PLACES - https://developers.google.com/places/web-service/search?hl=es
// NEUMORPHIC AESTHETICS - https://pub.dev/packages/flutter_neumorphic
// TINDER CARD - https://pub.dev/packages/flutter_tindercard
// AUTH INSTA/FB - https://pub.dev/packages/simple_auth_flutter
// INSTA AUTH/IMAGE PICKER - https://pub.dev/packages/flutter_instagram_image_picker#-example-tab-
