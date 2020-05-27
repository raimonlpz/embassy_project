import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:origin/screens/playground_screen.dart';
import '../models/ambassador.dart';
import '../screens/details_screen.dart';

class CardPlay extends StatefulWidget {
  final Ambassador ambassador;
  final dynamic ctx;
  CardPlay(this.ambassador, this.ctx);

  createState() => _CardPlayState();
}

class _CardPlayState extends State<CardPlay> {
  Widget displayReferences() {
    return Row(
        children: widget.ambassador.references
            .map(
              (reference) => Container(
                margin: EdgeInsets.only(right: 15, bottom: 20),
                child: Text(
                  '#$reference',
                  style: TextStyle(
                      fontFamily: 'Grifter',
                      fontSize: 10,
                      color: NeumorphicTheme.isUsingDark(widget.ctx)
                          ? Colors.tealAccent
                          : Colors.pink[200]),
                ),
              ),
            )
            .toList());
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          AwesomePageRoute(
            transitionDuration: Duration(milliseconds: 300),
            exitPage: widget,
            enterPage: DetailsScreen(widget.ctx, widget.ambassador),
            transition: StackTransition(),
          ),
        );
        // Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: {
        //   'ctx': ctx,
        //   'ambassador': ambassador,
        // });
      },
      child: Stack(
        children: [
          Neumorphic(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            style: NeumorphicStyle(
              color: NeumorphicTheme.baseColor(widget.ctx),
              border: NeumorphicBorder(
                color: NeumorphicTheme.baseColor(widget.ctx),
                width: 2.5,
              ),
              shape: NeumorphicShape.convex,
              depth: 4,
              lightSource: LightSource.top,
            ),
            child: Card(
              color: NeumorphicTheme.baseColor(widget.ctx),
              child: Column(children: [
                Container(
                  height: 200,
                  width: 300,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1.0, 2.0),
                        blurRadius: 2,
                      )
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.ambassador.imageUrl),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.ambassador.username,
                        style: TextStyle(
                            fontFamily: 'Grifter',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: NeumorphicTheme.isUsingDark(widget.ctx)
                                ? Colors.yellow[100]
                                : Colors.black),
                      ),
                      Text(
                        widget.ambassador.age.toString(),
                        style: TextStyle(
                            color: NeumorphicTheme.isUsingDark(widget.ctx)
                                ? Colors.tealAccent
                                : Colors.pink[100],
                            fontSize: 35,
                            fontFamily: 'Grifter'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(widget.ambassador.description,
                      style: TextStyle(
                          fontSize: 10.5,
                          color: Colors.grey,
                          fontFamily: 'Grifter')),
                ),
                SizedBox(height: 12),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Icon(Icons.location_on,
                        size: 20,
                        color: NeumorphicTheme.isUsingDark(widget.ctx)
                            ? Colors.yellow[100]
                            : Colors.black),
                    SizedBox(width: 7),
                    Text(widget.ambassador.location,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Grifter',
                            color: NeumorphicTheme.isUsingDark(widget.ctx)
                                ? Colors.yellow[100]
                                : Colors.black))
                  ]),
                ),
                SizedBox(height: 20),
                widget.ambassador.references.length > 0
                    ? Container(
                        margin: EdgeInsets.only(left: 45, right: 20),
                        child: displayReferences())
                    : SizedBox(height: 0),
              ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 390, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Neumorphic(
                  padding: EdgeInsets.all(8),
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  style: NeumorphicStyle(
                      border: NeumorphicBorder(
                        color: NeumorphicTheme.baseColor(widget.ctx),
                        width: 0.5,
                      ),
                      shape: NeumorphicShape.convex,
                      depth: 3,
                      lightSource: LightSource.topLeft,
                      color: NeumorphicTheme.baseColor(widget.ctx)),
                  child: Icon(AntDesign.dislike1,
                      size: 25,
                      color: NeumorphicTheme.isUsingDark(widget.ctx)
                          ? Colors.yellow[100]
                          : Colors.blueGrey),
                ),
                Neumorphic(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  padding: EdgeInsets.all(5),
                  style: NeumorphicStyle(
                      border: NeumorphicBorder(
                        color: NeumorphicTheme.baseColor(widget.ctx),
                        width: 0.5,
                      ),
                      shape: NeumorphicShape.convex,
                      depth: 3,
                      lightSource: LightSource.topLeft,
                      color: NeumorphicTheme.baseColor(widget.ctx)),
                  child: Icon(FontAwesome5.smile_beam,
                      size: 30,
                      color: NeumorphicTheme.isUsingDark(widget.ctx)
                          ? Colors.pink[300]
                          : Colors.redAccent),
                ),
              ],
            ),
          ),
          widget.ambassador.verified
              ? Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  child: Neumorphic(
                    padding: EdgeInsets.all(8),
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    style: NeumorphicStyle(
                        border: NeumorphicBorder(
                          color: NeumorphicTheme.baseColor(widget.ctx),
                          width: 0.5,
                        ),
                        shape: NeumorphicShape.convex,
                        depth: 3,
                        lightSource: LightSource.topLeft,
                        color: NeumorphicTheme.baseColor(widget.ctx)),
                    child: Column(children: [
                      Icon(Octicons.verified,
                          size: 16, color: Colors.blueAccent),
                    ]),
                  ),
                )
              : SizedBox(height: 0),
        ],
      ),
    );
  }
}
