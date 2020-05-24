import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../models/ambassador.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:url_launcher/url_launcher.dart';

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
          _selectedIndex == 1
              ? Container(
                  margin: EdgeInsets.only(top: 120, left: 10, right: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: ambassador.analytics.postsUrl.length,
                      itemBuilder: (BuildContext context, int ind) {
                        return GestureDetector(
                          onTap: () async {
                            if (await canLaunch(
                                'https://www.instagram.com/${ambassador.username}')) {
                              await launch(
                                  'https://www.instagram.com/${ambassador.username}',
                                  forceSafariVC: false,
                                  forceWebView: false);
                            }
                          },
                          child: Stack(children: [
                            Neumorphic(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(35)),
                              style: NeumorphicStyle(
                                color: NeumorphicTheme.baseColor(ctx),
                                shape: NeumorphicShape.flat,
                                depth: 2,
                                lightSource: LightSource.topLeft,
                              ),
                              child: Center(
                                child: Image.network(
                                    ambassador.analytics.postsUrl[ind],
                                    width: 300,
                                    height: 250,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              left: 250,
                              top: 160,
                              child: Neumorphic(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                  style: NeumorphicStyle(
                                    border: NeumorphicBorder(
                                      color: NeumorphicTheme.baseColor(ctx),
                                      width: 2.5,
                                    ),
                                    shape: NeumorphicShape.convex,
                                    depth: 8,
                                    lightSource: LightSource.topLeft,
                                    color: NeumorphicTheme.baseColor(ctx),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Text(
                                          '${ambassador.analytics.likesGraph[ind]}',
                                          style: TextStyle(
                                              color:
                                                  NeumorphicTheme.isUsingDark(
                                                          ctx)
                                                      ? Colors.yellow[100]
                                                      : Colors.black,
                                              fontFamily: 'Grifter',
                                              fontSize: 8)),
                                      SizedBox(width: 10),
                                      Icon(
                                        AntDesign.like1,
                                        size: 10,
                                        color: NeumorphicTheme.isUsingDark(ctx)
                                            ? Colors.yellow[100]
                                            : Colors.black,
                                      ),
                                    ],
                                  )),
                            ),
                            Positioned(
                              left: 250,
                              top: 205,
                              child: Neumorphic(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                  style: NeumorphicStyle(
                                    border: NeumorphicBorder(
                                      color: NeumorphicTheme.baseColor(ctx),
                                      width: 2.5,
                                    ),
                                    shape: NeumorphicShape.convex,
                                    depth: 8,
                                    lightSource: LightSource.topLeft,
                                    color: NeumorphicTheme.baseColor(ctx),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Text(
                                          '${ambassador.analytics.commentsGraph[ind]}',
                                          style: TextStyle(
                                              color:
                                                  NeumorphicTheme.isUsingDark(
                                                          ctx)
                                                      ? Colors.yellow[100]
                                                      : Colors.black,
                                              fontFamily: 'Grifter',
                                              fontSize: 8)),
                                      SizedBox(width: 10),
                                      Icon(
                                        FontAwesome5.comment_dots,
                                        size: 10,
                                        color: NeumorphicTheme.isUsingDark(ctx)
                                            ? Colors.yellow[100]
                                            : Colors.black,
                                      ),
                                    ],
                                  )),
                            ),
                          ]),
                        );
                      }))
              : SizedBox(height: 0),
          _selectedIndex == 2
              ? Container(
                  margin: EdgeInsets.only(
                      top: 120, left: 10, bottom: 10, right: 10),
                  height: 330,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Neumorphic(
                        margin: EdgeInsets.all(20),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(35)),
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.baseColor(ctx),
                          shape: NeumorphicShape.flat,
                          depth: 2,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 15),
                          child: RadarChart(
                            values: [
                              ambassador.analytics.totalLikes.toDouble(),
                              ambassador.analytics.totalViews.toDouble(),
                              ambassador.analytics.totalComments.toDouble(),
                              ambassador.analytics.followers.toDouble(),
                              ambassador.analytics.totalPosts.toDouble(),
                              ambassador.analytics.totalVideos.toDouble(),
                            ],
                            maxLinesForLabels: 2,
                            maxWidth: MediaQuery.of(context).size.width,
                            labels: [
                              '${ambassador.analytics.totalLikes}',
                              '${ambassador.analytics.totalViews}',
                              '${ambassador.analytics.totalComments}',
                              '${ambassador.analytics.followers}',
                              '${ambassador.analytics.totalPosts}',
                              '${ambassador.analytics.totalVideos}',
                            ],
                            textScaleFactor: 0.025,
                            animationDuration: Duration(milliseconds: 1500),
                            maxValue: ambassador.analytics.totalLikes * 2.0,
                            fillColor: Colors.pinkAccent,
                            chartRadiusFactor: 0.8,
                            labelColor: NeumorphicTheme.isUsingDark(ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                            strokeColor: NeumorphicTheme.isUsingDark(ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Neumorphic(
                        margin: EdgeInsets.all(20),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(35)),
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.baseColor(ctx),
                          shape: NeumorphicShape.flat,
                          depth: 2,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 15),
                          child: RadarChart(
                            values: [
                              ambassador.analytics.totalLikes.toDouble(),
                              ambassador.analytics.totalViews.toDouble(),
                              ambassador.analytics.totalComments.toDouble(),
                            ],
                            maxLinesForLabels: 2,
                            maxWidth: MediaQuery.of(context).size.width,
                            labels: [
                              '${ambassador.analytics.totalLikes}',
                              '${ambassador.analytics.totalViews}',
                              '${ambassador.analytics.totalComments}',
                            ],
                            textScaleFactor: 0.025,
                            animationDuration: Duration(milliseconds: 1500),
                            maxValue: ambassador.analytics.totalLikes * 2.0,
                            fillColor: Colors.pinkAccent,
                            chartRadiusFactor: 0.8,
                            labelColor: NeumorphicTheme.isUsingDark(ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                            strokeColor: NeumorphicTheme.isUsingDark(ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Neumorphic(
                        margin: EdgeInsets.all(20),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(35)),
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.baseColor(ctx),
                          shape: NeumorphicShape.flat,
                          depth: 2,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 15),
                          child: RadarChart(
                            values: ambassador.analytics.likesGraph
                                .map((post) => post.toDouble())
                                .toList(),
                            labels: ambassador.analytics.likesGraph
                                .map((post) => '$post')
                                .toList(),
                            animationDuration: Duration(milliseconds: 1500),
                            maxValue: ambassador.analytics
                                .findMaxLikesPerPost()
                                .toDouble(),
                            fillColor: Colors.pinkAccent,
                            chartRadiusFactor: 0.8,
                            textScaleFactor: 0.025,
                            labelColor: NeumorphicTheme.isUsingDark(ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                            strokeColor: NeumorphicTheme.isUsingDark(ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                          ),
                        ),
                      ),
                      Neumorphic(
                        margin: EdgeInsets.all(20),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(35)),
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.baseColor(ctx),
                          shape: NeumorphicShape.flat,
                          depth: 2,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 15),
                          child: RadarChart(
                            values: ambassador.analytics.commentsGraph
                                .map((post) => post.toDouble())
                                .toList(),
                            labels: ambassador.analytics.commentsGraph
                                .map((post) => '$post')
                                .toList(),
                            animationDuration: Duration(milliseconds: 1500),
                            maxValue: ambassador.analytics
                                .findMaxCommentsPerPost()
                                .toDouble(),
                            fillColor: Colors.pinkAccent,
                            chartRadiusFactor: 0.8,
                            textScaleFactor: 0.025,
                            labelColor: NeumorphicTheme.isUsingDark(ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                            strokeColor: NeumorphicTheme.isUsingDark(ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(height: 0),
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
