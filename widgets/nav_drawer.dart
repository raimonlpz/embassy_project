import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../screens/playground_screen.dart';
//import '../screens/profile_screen.dart';
import '../screens/homepage.dart';

class NavDrawer extends StatelessWidget {
  toggledDivider(double _thickness, dynamic ctx) {
    return Divider(
      thickness: _thickness,
      indent: 10,
      color: NeumorphicTheme.isUsingDark(ctx)
          ? Colors.yellow[100]
          : Colors.grey[200],
    );
  }

  toggledTile(dynamic _icon, String title, dynamic ctx, Widget screen) {
    return ListTile(
      onTap: () {
        //Navigator.of(ctx).pushNamed(route, arguments: ctx);
        Navigator.push(
          ctx,
          AwesomePageRoute(
            transitionDuration: Duration(milliseconds: 300),
            exitPage: HomePage(),
            enterPage: screen,
            transition: StackTransition(),
          ),
        );
      },
      leading: Icon(
        _icon,
        size: 23,
        color: NeumorphicTheme.isUsingDark(ctx)
            ? Colors.yellow[100]
            : Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 15,
            color: NeumorphicTheme.isUsingDark(ctx)
                ? Colors.yellow[100]
                : Colors.black87),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 130),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(75),
        ),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                //margin: EdgeInsets.only(left: 70, right: 70, bottom: 10),
                height: 80,
                child: DrawerHeader(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.only(top: 11),
                  child: ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: FlutterGradients.forestInei(),
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    toggledTile(Icons.insert_emoticon, 'Profile', context,
                        PlaygroundScreen(context)),
                    toggledDivider(1, context),
                    toggledTile(MaterialCommunityIcons.cards, 'Playground',
                        context, PlaygroundScreen(context)),
                    toggledDivider(1, context),
                    toggledTile(Ionicons.ios_chatbubbles, 'Chats', context,
                        PlaygroundScreen(context)),
                    toggledDivider(1, context),
                    toggledTile(Icons.settings, 'Settings', context,
                        PlaygroundScreen(context)),
                    toggledDivider(1, context),
                    toggledTile(
                        Icons.help, 'Help', context, PlaygroundScreen(context)),
                    toggledDivider(4, context),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ListTile(
                        onTap: () {},
                        title: Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                                fontSize: 12,
                                color: NeumorphicTheme.isUsingDark(context)
                                    ? Colors.yellow[100]
                                    : Colors.black87),
                          ),
                        ),
                        trailing: Icon(
                          MaterialCommunityIcons.logout,
                          size: 23,
                          color: NeumorphicTheme.isUsingDark(context)
                              ? Colors.yellow[100]
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
