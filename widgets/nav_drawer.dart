import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../screens/playground_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';

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

  toggledTile(dynamic _icon, String title, dynamic ctx) {
    return ListTile(
      onTap: () {
        Navigator.of(ctx).pushNamed(PlaygroundScreen.routeName, arguments: ctx);
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
      margin: EdgeInsets.only(bottom: 120),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(75),
        ),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 70, right: 70, bottom: 10),
                height: 100,
                child: DrawerHeader(
                  child: Neumorphic(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    style: NeumorphicStyle(
                        border: NeumorphicBorder(
                          color: NeumorphicTheme.isUsingDark(context)
                              ? Colors.grey[800]
                              : Colors.white,
                          width: 2.5,
                        ),
                        shape: NeumorphicShape.convex,
                        depth: 8,
                        lightSource: LightSource.topLeft,
                        color: NeumorphicTheme.isUsingDark(context)
                            ? null
                            : Colors.white),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Icon(
                            Entypo.air,
                            size: 30,
                            color: NeumorphicTheme.isUsingDark(context)
                                ? Colors.yellow[100]
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    toggledTile(Icons.insert_emoticon, 'Profile', context),
                    toggledDivider(1, context),
                    toggledTile(
                        MaterialCommunityIcons.cards, 'Playground', context),
                    toggledDivider(1, context),
                    toggledTile(Ionicons.ios_chatbubbles, 'Chats', context),
                    toggledDivider(1, context),
                    toggledTile(Icons.settings, 'Settings', context),
                    toggledDivider(1, context),
                    toggledTile(Icons.help, 'Help', context),
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
