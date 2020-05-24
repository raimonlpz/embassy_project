import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../widgets/back_button.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import '../widgets/card_play.dart';
import 'package:disposebag/disposebag.dart';
import '../models/ambassador.dart';

enum SearchGender { Male, Female, None }

class PlaygroundScreen extends StatefulWidget {
  static final routeName = '/audio-repro-screen';
  createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen>
    with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  CardController controller;
  List<Ambassador> _ambassadors = ambassadors;
  SearchGender genderFilter = SearchGender.None;

  @override
  dispose() {
    super.dispose();
    final bag = DisposeBag([controller]);
    bag.dispose();
  }

  @override
  initState() {
    super.initState();
    if (this.mounted) {
      controller = CardController();
    }
  }

  Widget build(BuildContext context) {
    final ctx = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: NeumorphicTheme.baseColor(ctx),
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Neumorphic(
                padding: EdgeInsets.all(8),
                boxShape: NeumorphicBoxShape.circle(),
                style: NeumorphicStyle(
                    border: NeumorphicBorder(
                      color: NeumorphicTheme.baseColor(ctx),
                      width: 0.5,
                    ),
                    shape: NeumorphicShape.convex,
                    depth: 3,
                    lightSource: LightSource.topLeft,
                    color: NeumorphicTheme.baseColor(ctx)),
                child: Icon(Foundation.asterisk,
                    size: 50,
                    color: NeumorphicTheme.isUsingDark(ctx)
                        ? Colors.yellow[100]
                        : Colors.black),
              ),
              SizedBox(height: 20),
              Text('Oops...',
                  style: TextStyle(
                      fontFamily: 'Grifter',
                      fontSize: 15,
                      color: NeumorphicTheme.isUsingDark(ctx)
                          ? Colors.yellow[100]
                          : Colors.black)),
              SizedBox(height: 20),
              Text('No more ambassadors for now!',
                  style: TextStyle(
                      fontFamily: 'Grifter',
                      fontSize: 12,
                      color: NeumorphicTheme.isUsingDark(ctx)
                          ? Colors.yellow[100]
                          : Colors.black))
            ],
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 120),
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            child: TinderSwapCard(
                animDuration: 230,
                orientation: AmassOrientation.BOTTOM,
                totalNum: _ambassadors.length,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.85,
                minHeight: MediaQuery.of(context).size.height * 0.85,
                cardBuilder: (_context, ind) => SingleChildScrollView(
                      child: CardPlay(_ambassadors[ind], ctx),
                    ),
                cardController: controller,
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  // if (align.x < 0) {
                  //   print('hey');
                  // } else if (align.x > 0) {
                  //   print('ho');
                  // }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  print('COMPLETED:');
                  print(orientation);
                  print(index);
                }),
          ),
        ),
        BackButtonWidget(ctx),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 45, left: 50, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NeumorphicRadio(
                boxShape: NeumorphicBoxShape.circle(),
                style: NeumorphicRadioStyle(
                  unselectedColor: NeumorphicTheme.baseColor(ctx),
                ),
                value: SearchGender.Male,
                groupValue: genderFilter,
                onChanged: (value) {
                  setState(() {
                    genderFilter = SearchGender.Male;
                  });
                },
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Ionicons.ios_male,
                  color: NeumorphicTheme.isUsingDark(ctx)
                      ? Colors.yellow[100]
                      : Colors.black,
                ),
              ),
              NeumorphicRadio(
                boxShape: NeumorphicBoxShape.circle(),
                style: NeumorphicRadioStyle(
                  unselectedColor: NeumorphicTheme.baseColor(ctx),
                ),
                value: SearchGender.Female,
                groupValue: genderFilter,
                onChanged: (value) {
                  setState(() {
                    genderFilter = SearchGender.Female;
                  });
                },
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Ionicons.ios_female,
                  color: NeumorphicTheme.isUsingDark(ctx)
                      ? Colors.yellow[100]
                      : Colors.black,
                ),
              ),
              NeumorphicRadio(
                style: NeumorphicRadioStyle(
                  unselectedColor: NeumorphicTheme.baseColor(ctx),
                ),
                boxShape: NeumorphicBoxShape.circle(),
                value: SearchGender.None,
                groupValue: genderFilter,
                onChanged: (value) {
                  setState(() {
                    genderFilter = SearchGender.None;
                  });
                },
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Ionicons.ios_transgender,
                  color: NeumorphicTheme.isUsingDark(ctx)
                      ? Colors.yellow[100]
                      : Colors.black,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
