import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:bubble_chart/bubble_chart.dart';
import '../../models/ambassador.dart';

enum LegendsId {
  totalLikes,
  totalViews,
  totalComments,
  totalFollowers,
  totalVideos,
  totalPosts,
  likesXPost,
  commentsXPost,
}

class Insights extends StatefulWidget {
  final dynamic ctx;
  final Ambassador ambassador;
  final ScrollController _controller = ScrollController();
  Insights(this.ctx, this.ambassador);
  createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 500),
        () => widget._controller.animateTo(
            widget._controller.position.maxScrollExtent,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubic));
  }

  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  Widget frontData(String txt, double result) {
    return Container(
      height: 120,
      width: 150,
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Neumorphic(
        margin: EdgeInsets.all(10),
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(35)),
        style: NeumorphicStyle(
          color: NeumorphicTheme.baseColor(widget.ctx),
          shape: NeumorphicShape.flat,
          depth: -2,
          intensity: 10,
          lightSource: LightSource.topLeft,
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Grifter',
                    fontSize: 13,
                    color: NeumorphicTheme.isUsingDark(widget.ctx)
                        ? Colors.yellow[100]
                        : Colors.black),
              ),
              SizedBox(height: 13),
              Text(
                '${double.parse((result).toStringAsFixed(2))}',
                style: TextStyle(
                    fontFamily: 'Grifter',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[100]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 115),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
            height: 120,
            child: ListView(
              controller: widget._controller,
              scrollDirection: Axis.horizontal,
              children: [
                frontData('Engagement Rate',
                    widget.ambassador.analytics.engagementRatio),
                frontData('Average Likes x Post',
                    widget.ambassador.analytics.averageLikesPerPost),
                frontData('Average Comments x Post',
                    widget.ambassador.analytics.averageCommentsPerPost),
                frontData('Average Views x Video',
                    widget.ambassador.analytics.averageViewsPerVideo),
                frontData('Average Posts x Week',
                    widget.ambassador.analytics.averagePostsPerWeek),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 340,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Stack(
                    children: [
                      Neumorphic(
                        margin: EdgeInsets.all(20),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(35)),
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.baseColor(widget.ctx),
                          shape: NeumorphicShape.flat,
                          depth: -5,
                          intensity: 10,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 3),
                          child: RadarChart(
                              values: [
                                widget.ambassador.analytics.totalLikes
                                    .toDouble(),
                                widget.ambassador.analytics.totalViews
                                    .toDouble(),
                                widget.ambassador.analytics.totalComments
                                    .toDouble(),
                                widget.ambassador.analytics.followers
                                    .toDouble(),
                                widget.ambassador.analytics.totalPosts
                                    .toDouble(),
                                widget.ambassador.analytics.totalVideos
                                    .toDouble(),
                              ],
                              maxWidth: MediaQuery.of(context).size.width,
                              labels: [
                                '${widget.ambassador.analytics.totalLikes}',
                                '${widget.ambassador.analytics.totalViews}',
                                '${widget.ambassador.analytics.totalComments}',
                                '${widget.ambassador.analytics.followers}',
                                '${widget.ambassador.analytics.totalPosts}',
                                '${widget.ambassador.analytics.totalVideos}',
                              ],
                              textScaleFactor: 0.025,
                              animationDuration: Duration(milliseconds: 1500),
                              maxValue:
                                  widget.ambassador.analytics.totalLikes * 2.0,
                              fillColor: NeumorphicTheme.isUsingDark(widget.ctx)
                                  ? Colors.yellow[100]
                                  : Colors.pinkAccent,
                              chartRadiusFactor: 0.8,
                              labelColor:
                                  NeumorphicTheme.isUsingDark(widget.ctx)
                                      ? Colors.yellow[100]
                                      : Colors.black,
                              strokeColor:
                                  NeumorphicTheme.isUsingDark(widget.ctx)
                                      ? Colors.yellow[100]
                                      : Colors.black),
                        ),
                      ),
                      legendSpiderChart(widget.ctx, 'Likes', AntDesign.like1,
                          105.0, 30.0, LegendsId.totalLikes),
                      legendSpiderChart(
                          widget.ctx,
                          'Views',
                          Foundation.play_video,
                          250.0,
                          65.0,
                          LegendsId.totalViews),
                      legendSpiderChart(
                          widget.ctx,
                          'Comments',
                          FontAwesome5.comment_dots,
                          275.0,
                          180.0,
                          LegendsId.totalComments),
                      legendSpiderChart(
                          widget.ctx,
                          'Followers',
                          SimpleLineIcons.user_following,
                          195.0,
                          280.0,
                          LegendsId.totalFollowers),
                      legendSpiderChart(widget.ctx, 'Posts', AntDesign.picture,
                          45.0, 243.0, LegendsId.totalPosts),
                      legendSpiderChart(
                          widget.ctx,
                          'Videos',
                          FontAwesome.video_camera,
                          25.0,
                          120.0,
                          LegendsId.totalVideos)
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Stack(
                  children: [
                    Neumorphic(
                      margin: EdgeInsets.all(20),
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(35)),
                      style: NeumorphicStyle(
                        color: NeumorphicTheme.baseColor(widget.ctx),
                        shape: NeumorphicShape.flat,
                        depth: -5,
                        intensity: 10,
                        lightSource: LightSource.topLeft,
                      ),
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.only(top: 35),
                        child: RadarChart(
                          values: [
                            widget.ambassador.analytics.totalLikes.toDouble(),
                            widget.ambassador.analytics.totalViews.toDouble(),
                            widget.ambassador.analytics.totalComments
                                .toDouble(),
                          ],
                          maxLinesForLabels: 2,
                          maxWidth: MediaQuery.of(context).size.width,
                          labels: [
                            '${widget.ambassador.analytics.totalLikes}',
                            '${widget.ambassador.analytics.totalViews}',
                            '${widget.ambassador.analytics.totalComments}',
                          ],
                          textScaleFactor: 0.025,
                          animationDuration: Duration(milliseconds: 1500),
                          maxValue:
                              widget.ambassador.analytics.totalLikes * 2.0,
                          fillColor: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.pinkAccent,
                          chartRadiusFactor: 0.8,
                          labelColor: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.black,
                          strokeColor: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.black,
                        ),
                      ),
                    ),
                    legendSpiderChart(widget.ctx, 'Likes', AntDesign.like1,
                        150.0, 25.0, LegendsId.totalLikes),
                    legendSpiderChart(
                        widget.ctx,
                        'Views',
                        Foundation.play_video,
                        255.0,
                        255.0,
                        LegendsId.totalViews),
                    legendSpiderChart(
                        widget.ctx,
                        'Comments',
                        FontAwesome5.comment_dots,
                        55.0,
                        255.0,
                        LegendsId.totalComments),
                  ],
                ),
                SizedBox(width: 20),
                Stack(
                  children: [
                    Neumorphic(
                      margin: EdgeInsets.all(20),
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(35)),
                      style: NeumorphicStyle(
                        color: NeumorphicTheme.baseColor(widget.ctx),
                        shape: NeumorphicShape.flat,
                        depth: -5,
                        intensity: 10,
                        lightSource: LightSource.topLeft,
                      ),
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.only(top: 15),
                        child: RadarChart(
                          values: widget.ambassador.analytics.likesGraph
                              .map((post) => post.toDouble())
                              .toList(),
                          labels: widget.ambassador.analytics.likesGraph
                              .map((post) => '$post')
                              .toList(),
                          animationDuration: Duration(milliseconds: 1500),
                          maxValue: widget.ambassador.analytics
                              .findMaxLikesPerPost()
                              .toDouble(),
                          fillColor: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.pinkAccent,
                          chartRadiusFactor: 0.8,
                          textScaleFactor: 0.025,
                          labelColor: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.black,
                          strokeColor: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.black,
                        ),
                      ),
                    ),
                    legendSpiderChart(widget.ctx, 'Likes x Post',
                        AntDesign.like1, 50.0, 30.0, LegendsId.likesXPost),
                  ],
                ),
                SizedBox(width: 20),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Stack(
                    children: [
                      Neumorphic(
                        margin: EdgeInsets.all(20),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(35)),
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.baseColor(widget.ctx),
                          shape: NeumorphicShape.flat,
                          depth: -5,
                          intensity: 10,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 15),
                          child: RadarChart(
                            values: widget.ambassador.analytics.commentsGraph
                                .map((post) => post.toDouble())
                                .toList(),
                            labels: widget.ambassador.analytics.commentsGraph
                                .map((post) => '$post')
                                .toList(),
                            animationDuration: Duration(milliseconds: 1500),
                            maxValue: widget.ambassador.analytics
                                .findMaxCommentsPerPost()
                                .toDouble(),
                            fillColor: NeumorphicTheme.isUsingDark(widget.ctx)
                                ? Colors.yellow[100]
                                : Colors.pinkAccent,
                            chartRadiusFactor: 0.8,
                            textScaleFactor: 0.025,
                            labelColor: NeumorphicTheme.isUsingDark(widget.ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                            strokeColor: NeumorphicTheme.isUsingDark(widget.ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                          ),
                        ),
                      ),
                      legendSpiderChart(
                          widget.ctx,
                          'Comments x Post',
                          FontAwesome5.comment_dots,
                          50.0,
                          30.0,
                          LegendsId.commentsXPost),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 330,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: () {
                      showCupertinoModalBottomSheet(
                          backgroundColor:
                              NeumorphicTheme.baseColor(widget.ctx),
                          bounce: true,
                          context: widget.ctx,
                          builder: (context, scrollController) {
                            return modalBottomNeumorphic(
                                'Engagement Rate Average. Based on the total sum of likes, comments & views, divided by followers & multiplied by 100:',
                                widget.ctx,
                                double.parse((widget
                                        .ambassador.analytics.engagementRatio)
                                    .toStringAsFixed(3)));
                          });
                    },
                    child: Stack(
                      children: [
                        Neumorphic(
                          margin: EdgeInsets.all(20),
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(35)),
                          style: NeumorphicStyle(
                            color: NeumorphicTheme.baseColor(widget.ctx),
                            shape: NeumorphicShape.flat,
                            depth: -5,
                            intensity: 10,
                            lightSource: LightSource.topLeft,
                          ),
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.only(top: 15),
                            child: BubbleChartLayout(
                              root: BubbleNode.node(padding: 30, children: [
                                BubbleNode.leaf(
                                  options: BubbleOptions(
                                      color: NeumorphicTheme.isUsingDark(
                                              widget.ctx)
                                          ? Colors.yellow[100]
                                          : Colors.pink[200],
                                      child: Icon(AntDesign.like1)),
                                  value: widget.ambassador.analytics.totalLikes,
                                ),
                                BubbleNode.leaf(
                                  options: BubbleOptions(
                                      color: NeumorphicTheme.isUsingDark(
                                              widget.ctx)
                                          ? Colors.yellow[100]
                                          : Colors.pink[100],
                                      child: Icon(FontAwesome5.comment_dots)),
                                  value:
                                      widget.ambassador.analytics.totalComments,
                                ),
                                BubbleNode.leaf(
                                  options: BubbleOptions(
                                      color: NeumorphicTheme.isUsingDark(
                                              widget.ctx)
                                          ? Colors.yellow[100]
                                          : Colors.pink[300],
                                      child: Icon(Foundation.play_video)),
                                  value: widget.ambassador.analytics.totalViews,
                                ),
                                BubbleNode.leaf(
                                  options: BubbleOptions(
                                      color: NeumorphicTheme.isUsingDark(
                                              widget.ctx)
                                          ? Colors.yellow[100]
                                          : Colors.pink[50],
                                      child:
                                          Icon(SimpleLineIcons.user_following)),
                                  value: widget.ambassador.analytics.followers,
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 260,
                          top: 40,
                          child: Neumorphic(
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(35)),
                            padding: EdgeInsets.all(10),
                            style: NeumorphicStyle(
                              color: NeumorphicTheme.baseColor(widget.ctx),
                              shape: NeumorphicShape.flat,
                              depth: 2,
                              intensity: 1,
                              lightSource: LightSource.topLeft,
                            ),
                            child: Icon(
                              Feather.help_circle,
                              color: NeumorphicTheme.isUsingDark(widget.ctx)
                                  ? Colors.yellow[100]
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalBottomSheet(
                        backgroundColor: NeumorphicTheme.baseColor(widget.ctx),
                        bounce: true,
                        context: widget.ctx,
                        builder: (context, scrollController) {
                          return modalBottomNeumorphic(
                              'Amount of Likes per Post. Max Likes in a Post:',
                              widget.ctx,
                              widget.ambassador.analytics
                                  .findMaxLikesPerPost());
                        });
                  },
                  child: Stack(
                    children: [
                      Neumorphic(
                        margin: EdgeInsets.all(20),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(35)),
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.baseColor(widget.ctx),
                          shape: NeumorphicShape.flat,
                          depth: -5,
                          intensity: 10,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          width: 300,
                          child: BubbleChartLayout(
                            root: BubbleNode.node(
                              padding: 10,
                              children: widget.ambassador.analytics.likesGraph
                                  .map((post) {
                                return BubbleNode.leaf(
                                  options: BubbleOptions(
                                    color:
                                        NeumorphicTheme.isUsingDark(widget.ctx)
                                            ? Colors.yellow[100]
                                            : Colors.pink[100],
                                  ),
                                  value: post,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 260,
                        top: 40,
                        child: Neumorphic(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(35)),
                          padding: EdgeInsets.all(10),
                          style: NeumorphicStyle(
                            color: NeumorphicTheme.baseColor(widget.ctx),
                            shape: NeumorphicShape.flat,
                            depth: 2,
                            intensity: 1,
                            lightSource: LightSource.topLeft,
                          ),
                          child: Icon(
                            AntDesign.like1,
                            color: NeumorphicTheme.isUsingDark(widget.ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      showCupertinoModalBottomSheet(
                          backgroundColor:
                              NeumorphicTheme.baseColor(widget.ctx),
                          bounce: true,
                          context: widget.ctx,
                          builder: (context, scrollController) {
                            return modalBottomNeumorphic(
                                'Amount of Comments per Post. Max Comments in a Post:',
                                widget.ctx,
                                widget.ambassador.analytics
                                    .findMaxCommentsPerPost());
                          });
                    },
                    child: Stack(
                      children: [
                        Neumorphic(
                          margin: EdgeInsets.all(20),
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(35)),
                          style: NeumorphicStyle(
                            color: NeumorphicTheme.baseColor(widget.ctx),
                            shape: NeumorphicShape.flat,
                            depth: -5,
                            intensity: 10,
                            lightSource: LightSource.topLeft,
                          ),
                          child: Container(
                            width: 300,
                            child: BubbleChartLayout(
                              root: BubbleNode.node(
                                padding: 10,
                                children: widget
                                    .ambassador.analytics.commentsGraph
                                    .map((post) {
                                  return BubbleNode.leaf(
                                    options: BubbleOptions(
                                      color: NeumorphicTheme.isUsingDark(
                                              widget.ctx)
                                          ? Colors.yellow[100]
                                          : Colors.pink[100],
                                    ),
                                    value: post,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 260,
                          top: 40,
                          child: Neumorphic(
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(35)),
                            padding: EdgeInsets.all(10),
                            style: NeumorphicStyle(
                              color: NeumorphicTheme.baseColor(widget.ctx),
                              shape: NeumorphicShape.flat,
                              depth: 2,
                              intensity: 1,
                              lightSource: LightSource.topLeft,
                            ),
                            child: Icon(
                              FontAwesome5.comment_dots,
                              color: NeumorphicTheme.isUsingDark(widget.ctx)
                                  ? Colors.yellow[100]
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget modalBottomNeumorphic(String txt, dynamic ctx, dynamic result) {
    return Container(
      height: 200,
      child: Neumorphic(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.only(left: 15, right: 15),
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(35)),
        style: NeumorphicStyle(
          color: NeumorphicTheme.baseColor(ctx),
          shape: NeumorphicShape.convex,
          intensity: 1,
          lightSource: LightSource.topLeft,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AntDesign.instagram,
              size: 35,
              color: NeumorphicTheme.isUsingDark(ctx)
                  ? Colors.yellow[100]
                  : Colors.black,
            ),
            SizedBox(height: 20),
            Text(
              txt,
              style: TextStyle(
                  fontFamily: 'Grifter',
                  color: NeumorphicTheme.isUsingDark(ctx)
                      ? Colors.yellow[100]
                      : Colors.black),
            ),
            SizedBox(height: 10),
            Text('$result',
                style: TextStyle(
                    fontFamily: 'Grifter',
                    color: Colors.pink[100],
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget legendSpiderChart(dynamic ctx, String content, IconData icon,
      double left, double top, LegendsId legendId) {
    LegendsId choice = legendId;
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () {
          showCupertinoModalBottomSheet(
            backgroundColor: NeumorphicTheme.baseColor(ctx),
            bounce: true,
            context: ctx,
            builder: (context, scrollController) {
              switch (choice) {
                case LegendsId.totalLikes:
                  {
                    return modalBottomNeumorphic(
                        'Total Likes over last 40 posts:',
                        ctx,
                        widget.ambassador.analytics.totalLikes);
                  }
                  break;
                case LegendsId.totalComments:
                  {
                    return modalBottomNeumorphic(
                        'Total Comments over last 40 posts:',
                        ctx,
                        widget.ambassador.analytics.totalComments);
                  }
                  break;
                case LegendsId.totalViews:
                  {
                    return modalBottomNeumorphic(
                        'Total Views over last ${widget.ambassador.analytics.totalVideos} videos:',
                        ctx,
                        widget.ambassador.analytics.totalViews);
                  }
                  break;
                case LegendsId.totalFollowers:
                  {
                    return modalBottomNeumorphic('Total amount of Followers:',
                        ctx, widget.ambassador.analytics.followers);
                  }
                  break;
                case LegendsId.totalVideos:
                  {
                    return modalBottomNeumorphic('Total Video related posts:',
                        ctx, widget.ambassador.analytics.totalVideos);
                  }
                  break;
                case LegendsId.totalPosts:
                  {
                    return modalBottomNeumorphic('Total Image related posts:',
                        ctx, widget.ambassador.analytics.totalPosts);
                  }
                  break;
                case LegendsId.likesXPost:
                  {
                    return modalBottomNeumorphic(
                        'Amount of Likes per Post. Max Likes in a Post:',
                        ctx,
                        widget.ambassador.analytics.findMaxLikesPerPost());
                  }
                  break;
                case LegendsId.commentsXPost:
                  {
                    return modalBottomNeumorphic(
                        'Amount of Comments per Post. Max Comments in a Post:',
                        ctx,
                        widget.ambassador.analytics.findMaxCommentsPerPost());
                  }
                  break;
                default:
                  return null;
              }
            },
          );
        },
        child: Neumorphic(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          style: NeumorphicStyle(
            border: NeumorphicBorder(
              color: NeumorphicTheme.baseColor(ctx),
              width: 2.5,
            ),
            shape: NeumorphicShape.flat,
            depth: 1,
            intensity: 1.0,
            lightSource: LightSource.topLeft,
            color: NeumorphicTheme.isUsingDark(ctx)
                ? Colors.yellow[100]
                : Colors.pink[50],
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
  }
}
