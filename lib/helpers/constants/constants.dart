import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color white = Colors.white;
Color black = Colors.black;

//Colors

const kPrimaryColor = Color(0xff40ACA1);
const kSecounderyColor = Color(0xffFEF7E1);
const kBackgroundColor = Color(0xffFFFFFF);
const kTextColor = Color(0xff000000);
const kSecounderyTextColor = Color(0xff494A4B);
const kDividerColor = Color(0xffE4E4E4);
const kActiveStatus = Color(0xff22C375);
const kShadowColor = Color(0xffF4F2EC);
Color ksubtitleColor = const Color(0xff494A4B).withOpacity(0.4);

final kdefaultPadding = 20.r;

// Text Style
TextStyle kHeadingTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w900,
  color: kTextColor,
);

TextStyle kTitleTextstyle = TextStyle(
  fontSize: 15,
  color: kTextColor.withOpacity(0.84),
  fontWeight: FontWeight.w400,
);

const kSubtitleStye = TextStyle(
  fontSize: 12,
  color: kSecounderyTextColor,
  // fontWeight: FontWeight.w300,
);

// ignore: camel_case_types, must_be_immutable
class gapHeight extends StatelessWidget {
  double size;
  gapHeight({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size.h);
  }
}

// ignore: must_be_immutable, camel_case_types
class gapWidth extends StatelessWidget {
  double size;
  gapWidth({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size.h);
  }
}
