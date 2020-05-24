import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ToggleLights extends StatefulWidget {
  createState() => _ToggleLightsState();
}

class _ToggleLightsState extends State<ToggleLights> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height - 60, left: 30),
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
              ),
              boxShape: NeumorphicBoxShape.circle(),
              padding: const EdgeInsets.all(9.0),
              child: _iconType(context),
            )),
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height - 55,
              left: MediaQuery.of(context).size.width - 85),
          child: NeumorphicSwitch(
            value: isActive,
            height: 32,
            duration: Duration(milliseconds: 400),
            onChanged: (_) {
              NeumorphicTheme.of(context).usedTheme =
                  NeumorphicTheme.isUsingDark(context)
                      ? UsedTheme.LIGHT
                      : UsedTheme.DARK;
              setState(() {
                isActive = !isActive;
              });
            },
            style: NeumorphicSwitchStyle(
                inactiveTrackColor: Colors.pink[100],
                activeTrackColor: Colors.tealAccent,
                thumbShape: NeumorphicShape.concave),
          ),
        ),
      ],
    );
  }

  Color _iconsColor(BuildContext ctx) {
    final theme = NeumorphicTheme.of(ctx);
    if (theme.isUsingDark) {
      return Colors.yellow[100];
    } else {
      return null;
    }
  }

  Icon _iconType(BuildContext ctx) {
    if (NeumorphicTheme.isUsingDark(ctx)) {
      return Icon(Icons.brightness_2, color: _iconsColor(ctx), size: 18);
    } else {
      return Icon(Icons.wb_sunny, color: _iconsColor(ctx), size: 18);
    }
  }
}
