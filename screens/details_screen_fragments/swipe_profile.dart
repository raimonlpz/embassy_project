import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../models/ambassador.dart';

class SwipeProfile extends StatefulWidget {
  final dynamic ctx;
  final Ambassador ambassador;

  SwipeProfile(this.ctx, this.ambassador);
  createState() => _SwipeProfileState();
}

class _SwipeProfileState extends State<SwipeProfile> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 140),
      alignment: Alignment.center,
      child: Column(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Neumorphic(
                    margin: EdgeInsets.only(left: 150),
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
                    style: NeumorphicStyle(
                      color: Color.fromARGB(5, 0, 0, 0),
                      shape: NeumorphicShape.convex,
                      depth: 3,
                      intensity: 1,
                      lightSource: LightSource.topLeft,
                    ),
                    child: Container(
                      height: 160,
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text('@${widget.ambassador.username}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Grifter2',
                                  fontSize: 13,
                                  color: NeumorphicTheme.isUsingDark(widget.ctx)
                                      ? Colors.yellow[100]
                                      : Colors.black)),
                          SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Entypo.location_pin,
                                    size: 12,
                                    color:
                                        NeumorphicTheme.isUsingDark(widget.ctx)
                                            ? Colors.yellow[100]
                                            : Colors.grey[800]),
                                Text('${widget.ambassador.location}',
                                    style: TextStyle(
                                        fontFamily: 'Grifter',
                                        fontSize: 12,
                                        color: NeumorphicTheme.isUsingDark(
                                                widget.ctx)
                                            ? Colors.yellow[100]
                                            : Colors.grey[800])),
                              ]),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${widget.ambassador.age} y.o.   | ',
                                    style: TextStyle(
                                        fontFamily: 'Grifter',
                                        fontSize: 16,
                                        color: NeumorphicTheme.isUsingDark(
                                                widget.ctx)
                                            ? Colors.yellow[100]
                                            : Colors.black)),
                                SizedBox(width: 10),
                                widget.ambassador.gender == 'male'
                                    ? Container(
                                        alignment: Alignment.center,
                                        child: Icon(Ionicons.ios_male,
                                            size: 18,
                                            color: NeumorphicTheme.isUsingDark(
                                                    widget.ctx)
                                                ? Colors.yellow[100]
                                                : Colors.black))
                                    : Container(
                                        alignment: Alignment.center,
                                        child: Icon(Ionicons.ios_female,
                                            size: 18,
                                            color: NeumorphicTheme.isUsingDark(
                                                    widget.ctx)
                                                ? Colors.yellow[100]
                                                : Colors.black)),
                              ]),
                          SizedBox(height: 35),
                          Text('${widget.ambassador.analytics.followers}',
                              style: TextStyle(
                                  fontFamily: 'Grifter',
                                  fontSize: 20,
                                  color: NeumorphicTheme.isUsingDark(widget.ctx)
                                      ? Colors.yellow[100]
                                      : Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 305, top: 122),
                    child: Icon(FontAwesome.user,
                        size: 25,
                        color: NeumorphicTheme.isUsingDark(widget.ctx)
                            ? Colors.yellow[100]
                            : Colors.black),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 18),
                child: Neumorphic(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.baseColor(widget.ctx),
                    shape: NeumorphicShape.flat,
                    depth: 4,
                    intensity: 1,
                    lightSource: LightSource.topLeft,
                  ),
                  child: Container(
                    height: 160,
                    width: 150,
                    child: Image.network(
                      widget.ambassador.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 25),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: widget.ambassador.references
                    .map((reference) => Neumorphic(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(25)),
                        style: NeumorphicStyle(
                          color: NeumorphicTheme.baseColor(widget.ctx),
                          shape: NeumorphicShape.flat,
                          depth: 1,
                          intensity: 1,
                          lightSource: LightSource.topLeft,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            '#$reference',
                            style: TextStyle(
                                fontFamily: 'Grifter',
                                fontSize: 12,
                                color: NeumorphicTheme.isUsingDark(widget.ctx)
                                    ? Colors.yellow[100]
                                    : Colors.pink[200]),
                          ),
                        )))
                    .toList(),
              ),
            ),
          ),
          Neumorphic(
            margin: EdgeInsets.only(top: 30),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(35)),
            style: NeumorphicStyle(
              color: NeumorphicTheme.baseColor(widget.ctx),
              shape: NeumorphicShape.flat,
              depth: 2,
              intensity: 1,
              lightSource: LightSource.topLeft,
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Row(children: [
                    Icon(
                      Entypo.text,
                      color: NeumorphicTheme.isUsingDark(widget.ctx)
                          ? Colors.yellow[100]
                          : Colors.black,
                    ),
                    SizedBox(width: 20),
                    Text('Description',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Grifter',
                          color: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.black,
                        )),
                  ])),
                  Icon(
                    EvilIcons.arrow_down,
                    color: NeumorphicTheme.isUsingDark(widget.ctx)
                        ? Colors.yellow[100]
                        : Colors.black,
                  )
                ],
              ),
            ),
          ),
          Neumorphic(
            margin: EdgeInsets.only(top: 30),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(35)),
            style: NeumorphicStyle(
              color: NeumorphicTheme.baseColor(widget.ctx),
              shape: NeumorphicShape.flat,
              depth: 2,
              intensity: 1,
              lightSource: LightSource.topLeft,
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Row(children: [
                    Icon(
                      MaterialIcons.work,
                      color: NeumorphicTheme.isUsingDark(widget.ctx)
                          ? Colors.yellow[100]
                          : Colors.black,
                    ),
                    SizedBox(width: 20),
                    Text('Experience',
                        style: TextStyle(
                          fontFamily: 'Grifter',
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.black,
                        )),
                  ])),
                  Icon(
                    EvilIcons.arrow_down,
                    color: NeumorphicTheme.isUsingDark(widget.ctx)
                        ? Colors.yellow[100]
                        : Colors.black,
                  )
                ],
              ),
            ),
          ),
          Neumorphic(
            margin: EdgeInsets.only(top: 30),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(35)),
            style: NeumorphicStyle(
              color: NeumorphicTheme.baseColor(widget.ctx),
              shape: NeumorphicShape.flat,
              depth: 2,
              intensity: 1,
              lightSource: LightSource.topLeft,
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          MaterialCommunityIcons.cash_multiple,
                          color: NeumorphicTheme.isUsingDark(widget.ctx)
                              ? Colors.yellow[100]
                              : Colors.black,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Salary Expectation',
                          style: TextStyle(
                            fontFamily: 'Grifter',
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            color: NeumorphicTheme.isUsingDark(widget.ctx)
                                ? Colors.yellow[100]
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    EvilIcons.arrow_down,
                    color: NeumorphicTheme.isUsingDark(widget.ctx)
                        ? Colors.yellow[100]
                        : Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
