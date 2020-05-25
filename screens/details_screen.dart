import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'details_screen_fragments/insights.dart';
import 'details_screen_fragments/work.dart';
import 'details_screen_fragments/profile.dart';
import '../models/ambassador.dart';

class DetailsScreen extends StatefulWidget {
  static final routeName = '/details-screen';
  createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    final argsScreen = ModalRoute.of(context).settings.arguments as Map;
    final ctx = argsScreen['ctx'];
    Ambassador ambassador = argsScreen['ambassador'];
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(ctx),
      body: Stack(
        children: [
          _selectedIndex == 0 ? Profile(ctx, ambassador) : SizedBox(height: 0),
          _selectedIndex == 1 ? Work(ctx, ambassador) : SizedBox(height: 0),
          _selectedIndex == 2 ? Insights(ctx, ambassador) : SizedBox(height: 0),
          Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            alignment: Alignment.topCenter,
            child: NeumorphicToggle(
              thumb: Neumorphic(
                style: NeumorphicStyle(
                    color: NeumorphicTheme.isUsingDark(ctx)
                        ? Colors.yellow[100]
                        : null),
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.all(Radius.circular(12))),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              height: 60,
              style: NeumorphicToggleStyle(
                backgroundColor: NeumorphicTheme.baseColor(ctx),
              ),
              selectedIndex: _selectedIndex,
              displayForegroundOnlyIfSelected: true,
              children: [
                ToggleElement(
                  background: Center(
                    child: Column(children: [
                      SizedBox(height: 7),
                      Icon(Icons.person_outline,
                          color: NeumorphicTheme.isUsingDark(ctx)
                              ? Colors.yellow[100]
                              : null),
                      SizedBox(height: 4),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: NeumorphicTheme.isUsingDark(ctx) &&
                                  _selectedIndex != 0
                              ? Colors.yellow[100]
                              : null,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Grifter',
                          fontSize: 12,
                        ),
                      )
                    ]),
                  ),
                  foreground: Center(
                    child: Text('Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Grifter',
                          fontSize: 12,
                        )),
                  ),
                ),
                ToggleElement(
                  background: Center(
                    child: Column(children: [
                      SizedBox(height: 7),
                      Icon(Entypo.network,
                          color: NeumorphicTheme.isUsingDark(ctx)
                              ? Colors.yellow[100]
                              : null),
                      SizedBox(height: 4),
                      Text(
                        'Work',
                        style: TextStyle(
                            color: NeumorphicTheme.isUsingDark(ctx) &&
                                    _selectedIndex != 1
                                ? Colors.yellow[100]
                                : null,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Grifter',
                            fontSize: 12),
                      )
                    ]),
                  ),
                  foreground: Center(
                    child: Text('Work',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Grifter',
                          fontSize: 12,
                        )),
                  ),
                ),
                ToggleElement(
                  background: Center(
                    child: Column(children: [
                      SizedBox(height: 7),
                      Icon(Entypo.line_graph,
                          color: NeumorphicTheme.isUsingDark(ctx)
                              ? Colors.yellow[100]
                              : null),
                      SizedBox(height: 4),
                      Text(
                        'Insights',
                        style: TextStyle(
                          color: NeumorphicTheme.isUsingDark(ctx) &&
                                  _selectedIndex != 2
                              ? Colors.yellow[100]
                              : null,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Grifter',
                          fontSize: 12,
                        ),
                      )
                    ]),
                  ),
                  foreground: Center(
                    child: Text('Insights',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Grifter')),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 20),
            child: NeumorphicButton(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              style: NeumorphicStyle(
                  border: NeumorphicBorder(
                    color: NeumorphicTheme.baseColor(ctx),
                    width: 0.5,
                  ),
                  shape: NeumorphicShape.convex,
                  depth: 3,
                  lightSource: LightSource.topLeft,
                  color: NeumorphicTheme.baseColor(ctx)),
              child: Container(
                child: Icon(MaterialIcons.arrow_drop_down_circle,
                    color: NeumorphicTheme.isUsingDark(ctx)
                        ? Colors.yellow[100]
                        : Colors.black),
              ),
              onClick: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
