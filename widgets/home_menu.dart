import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../screens/homepage.dart';
import '../screens/playground_screen.dart';
//import '../screens/profile_screen.dart';

class HomeMenu extends StatelessWidget {
  Widget menuItem(IconData icon, dynamic ctx, Widget route) {
    return Container(
      child: NeumorphicButton(
        boxShape: NeumorphicBoxShape.circle(),
        padding: EdgeInsets.all(30),
        style: NeumorphicStyle(
          color: NeumorphicTheme.baseColor(ctx),
          border: NeumorphicBorder(
            color: NeumorphicTheme.isUsingDark(ctx)
                ? Colors.grey[800]
                : Colors.white,
            width: NeumorphicTheme.isUsingDark(ctx) ? 2.0 : 2.5,
          ),
          shape: NeumorphicShape.convex,
          depth: 8,
          lightSource: LightSource.left,
        ),
        child: Icon(
          icon,
          color: NeumorphicTheme.isUsingDark(ctx)
              ? Colors.yellow[100]
              : Colors.black,
          size: 30,
        ),
        onClick: () {
          //Navigator.of(ctx).pushNamed(route, arguments: ctx);
          Navigator.push(
              ctx,
              AwesomePageRoute(
                transitionDuration: Duration(milliseconds: 300),
                exitPage: HomePage(),
                enterPage: route,
                transition: StackTransition(),
              ));
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 140),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          menuItem(MaterialCommunityIcons.cards_outline, context,
              PlaygroundScreen(context)),
          menuItem(
              Ionicons.ios_chatbubbles, context, PlaygroundScreen(context)),
          menuItem(Icons.insert_emoticon, context, PlaygroundScreen(context)),
        ],
      ),
    );
  }
}
