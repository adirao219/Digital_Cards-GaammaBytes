import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color pink9000c = fromHex('#0c5a0f2e');

  static Color gray5001 = fromHex('#fcf8f8');

  static Color deepOrangeA100 = fromHex('#ffa67e');

  static Color gray5002 = fromHex('#fffafa');

  static Color gray5003 = fromHex('#f8f8f8');

  static Color gray5004 = fromHex('#f9f9f9');

  static Color blueA400 = fromHex('#1877f2');

  static Color pink900 = fromHex('#5a0f2e');

  static Color deepOrange60033 = fromHex('#33ff570c');

  static Color black9003f = fromHex('#3f000000');

  static Color red10001 = fromHex('#ffcce1');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color deepOrangeA10066 = fromHex('#66ffa67e');

  static Color deepOrange300 = fromHex('#ff8650');

  static Color gray20001 = fromHex('#efefef');

  static Color blueGray900 = fromHex('#333333');

  static Color cyanA2002d = fromHex('#2d2ce5ff');

  static Color redA700 = fromHex('#e60023');

  static Color deepOrange100 = fromHex('#e2c0b1');

  static Color deepOrangeA1005b = fromHex('#5bffa67d');

  static Color gray400 = fromHex('#b2b1b1');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color gray800 = fromHex('#4a4949');

  static Color blue500 = fromHex('#1da1f2');

  static Color deepOrange10033 = fromHex('#33ffd3bf');

  static Color deepOrange40033 = fromHex('#33ff8048');

  static Color gray200 = fromHex('#e8e6ea');

  static Color deepPurple50 = fromHex('#e0d7ff');

  static Color deepOrangeA10099 = fromHex('#99ffa67e');

  static Color bluegray400 = fromHex('#888888');

  static Color redA40000 = fromHex('#00ff2727');

  static Color redA70001 = fromHex('#ff0000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color purpleA2002d = fromHex('#2dbb2cff');

  static Color gray70001 = fromHex('#5f5f5f');

  static Color deepOrangeA100A3 = fromHex('#a3ffa67d');

  static Color deepPurple100 = fromHex('#c7b9ff');

  static Color gray50 = fromHex('#fcfcfc');

  static Color gray300Cc = fromHex('#ccdddddd');

  static Color red100 = fromHex('#fcd6d6');

  static Color black90066 = fromHex('#66000000');

  static Color black900 = fromHex('#000000');

  static Color pinkA400 = fromHex('#f00073');

  static Color purple50 = fromHex('#ffd2ff');

  static Color yellow100 = fromHex('#ffffd1');

  static Color gray90002 = fromHex('#1c1b2d');

  static Color gray90003 = fromHex('#242222');

  static Color gray700 = fromHex('#666666');

  static Color gray90004 = fromHex('#111111');

  static Color blue800 = fromHex('#2867b2');

  static Color gray900 = fromHex('#2e1f25');

  static Color gray90001 = fromHex('#3f0303');

  static Color lightBlue50 = fromHex('#d7eeff');

  static Color gray300 = fromHex('#dddddd');

  static Color gray30001 = fromHex('#e1e1e1');

  static Color deepOrangeA10033 = fromHex('#33ffa67e');

  static Color deepOrange20033 = fromHex('#33ffaf8c');

  static Color whiteA70001 = fromHex('#fffcfc');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
