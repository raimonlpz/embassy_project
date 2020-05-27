import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//import 'login_form_screen.dart';
import 'homepage.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/login.gif'),
                  fit: BoxFit.fitWidth),
            ),
          ),
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              decoration: BoxDecoration(
                gradient: FlutterGradients.forestInei(),
              ),
              height: 240,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClipperOne(reverse: true, flip: true),
              child: Container(
                decoration: BoxDecoration(
                  gradient: FlutterGradients.forestInei(),
                ),
                height: 110,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 100),
            child: Text(
              'embassy',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'Grifter2',
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 65,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height - 185,
                left: 50,
                right: 50),
            child: NeumorphicButton(
              onClick: () {
                //Navigator.of(context).pushNamed(HomePage.routeName);
                Navigator.push(
                  context,
                  AwesomePageRoute(
                    transitionDuration: Duration(milliseconds: 400),
                    exitPage: LoginScreen(),
                    enterPage: HomePage(), //LoginFormScreen(),
                    transition: CubeTransition(),
                  ),
                );
              },
              style: NeumorphicStyle(color: Colors.black),
              child: Row(
                children: [
                  Icon(AntDesign.googleplus, color: Colors.white),
                  SizedBox(width: 20),
                  Text('Sign in with Google',
                      style: TextStyle(
                          fontFamily: 'Grifter', color: Colors.white)),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 65,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height - 130,
                left: 50,
                right: 50),
            child: NeumorphicButton(
              onClick: () {},
              style: NeumorphicStyle(color: Colors.white),
              child: Row(
                children: [
                  Icon(Zocial.email, color: Colors.black),
                  SizedBox(width: 20),
                  Text('Sign in with Email',
                      style: TextStyle(
                          fontFamily: 'Grifter', color: Colors.black)),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height - 110),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Already have an account? Tap to Login',
                      style: TextStyle(
                          fontFamily: 'Grifter',
                          fontSize: 12,
                          color: Colors.white)),
                  SizedBox(width: 4),
                  Icon(AntDesign.arrowright, size: 11, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
