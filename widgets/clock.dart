import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Clock extends StatelessWidget {
  Widget build(BuildContext context) {
    return Neumorphic(
      boxShape:
          NeumorphicBoxShape.circle(), //roundRect(BorderRadius.circular(12)),
      style: NeumorphicStyle(
          border: NeumorphicBorder(
            color: NeumorphicTheme.isUsingDark(context)
                ? Colors.grey[800]
                : Colors.white,
            width: 6.5,
          ),
          shape: NeumorphicShape.concave,
          depth: 8,
          lightSource: LightSource.topLeft,
          color: NeumorphicTheme.isUsingDark(context) ? null : Colors.white),
      child: Container(
        padding: EdgeInsets.all(30),
        child: AnalogClock(
          height: 150.0,
          isLive: true,
          secondHandColor: Colors.tealAccent,
          hourHandColor: NeumorphicTheme.isUsingDark(context)
              ? Colors.pinkAccent
              : Colors.black87,
          minuteHandColor: NeumorphicTheme.isUsingDark(context)
              ? Colors.pinkAccent
              : Colors.black87,
          showSecondHand: true,
          numberColor: NeumorphicTheme.isUsingDark(context)
              ? Colors.yellow[100]
              : Colors.black87,
          showNumbers: true,
          textScaleFactor: 1.4,
          showTicks: true,
          showDigitalClock: false,
        ),
      ),
    );
  }
}
