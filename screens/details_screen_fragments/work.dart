import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../models/ambassador.dart';

class Work extends StatefulWidget {
  final dynamic ctx;
  final Ambassador ambassador;
  final ScrollController _controller = ScrollController();
  Work(this.ctx, this.ambassador);
  createState() => _WorkState();
}

class _WorkState extends State<Work> {
  initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 500),
        () => widget._controller.animateTo(
            widget._controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 1500),
            curve: Curves.easeInOutCubic));
  }

  @override
  void dispose() {
    super.dispose();
    widget._controller.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 120, left: 10, right: 10),
      child: ListView.builder(
        controller: widget._controller,
        scrollDirection: Axis.vertical,
        itemCount: widget.ambassador.analytics.postsUrl.length,
        itemBuilder: (BuildContext context, int ind) {
          return GestureDetector(
            onTap: () async {
              if (await canLaunch(
                  'https://www.instagram.com/${widget.ambassador.username}')) {
                await launch(
                    'https://www.instagram.com/${widget.ambassador.username}',
                    forceSafariVC: false,
                    forceWebView: false);
              }
            },
            child: Stack(
              children: [
                Neumorphic(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(35)),
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.baseColor(widget.ctx),
                    shape: NeumorphicShape.flat,
                    depth: 2,
                    lightSource: LightSource.topLeft,
                  ),
                  child: Center(
                    child: Image.network(
                        widget.ambassador.analytics.postsUrl[ind],
                        fit: BoxFit.contain),
                  ),
                ),
                Positioned(
                  bottom: 75,
                  left: 25,
                  child: Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      style: NeumorphicStyle(
                        border: NeumorphicBorder(
                          color: NeumorphicTheme.baseColor(widget.ctx),
                          width: 2.5,
                        ),
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        lightSource: LightSource.topLeft,
                        color: NeumorphicTheme.baseColor(widget.ctx),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text('${widget.ambassador.analytics.likesGraph[ind]}',
                              style: TextStyle(
                                  color: NeumorphicTheme.isUsingDark(widget.ctx)
                                      ? Colors.yellow[100]
                                      : Colors.black,
                                  fontFamily: 'Grifter',
                                  fontSize: 12)),
                          SizedBox(width: 10),
                          Icon(
                            AntDesign.like1,
                            size: 10,
                            color: NeumorphicTheme.isUsingDark(widget.ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                          ),
                        ],
                      )),
                ),
                Positioned(
                  bottom: 30,
                  left: 25,
                  child: Neumorphic(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    style: NeumorphicStyle(
                      border: NeumorphicBorder(
                        color: NeumorphicTheme.baseColor(widget.ctx),
                        width: 2.5,
                      ),
                      shape: NeumorphicShape.concave,
                      depth: 8,
                      lightSource: LightSource.topLeft,
                      color: NeumorphicTheme.baseColor(widget.ctx),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                            '${widget.ambassador.analytics.commentsGraph[ind]}',
                            style: TextStyle(
                                color: NeumorphicTheme.isUsingDark(widget.ctx)
                                    ? Colors.yellow[100]
                                    : Colors.black,
                                fontFamily: 'Grifter',
                                fontSize: 12)),
                        SizedBox(width: 10),
                        Icon(
                          FontAwesome5.comment_dots,
                          size: 10,
                          color: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
