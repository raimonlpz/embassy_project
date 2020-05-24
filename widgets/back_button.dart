import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BackButtonWidget extends StatelessWidget {
  final ctx;
  BackButtonWidget(this.ctx);

  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 50,
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
          child: Icon(Ionicons.ios_arrow_dropleft,
              color: NeumorphicTheme.isUsingDark(ctx)
                  ? Colors.yellow[100]
                  : Colors.black),
        ),
        onClick: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
