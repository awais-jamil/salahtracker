import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTextStyle {

  static TextStyle title(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.bold,  fontFamily: 'Poppins-Regular', fontSize: 24.0, color: Colors.white);
  }
  static TextStyle titleBlack(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.bold,  fontFamily: 'Poppins-Regular', fontSize: 24.0, color: Color(AHColors.ahBackgroundBlue));
  }
  static TextStyle subtitleBlack(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.bold, fontFamily: 'Poppins-Regular', fontSize: 24.0, color: Color(AHColors.ahBackgroundBlue));
  }
  static TextStyle subtitle(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.bold, fontFamily: 'Poppins-Regular', fontSize: 24.0, color: Colors.white);
  }
  static TextStyle titleBold(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold , fontFamily: 'Poppins-Bold', fontSize: 42.0, color: Colors.amberAccent);
  }
  static TextStyle titleBold36(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold , fontFamily: 'Poppins-Bold', fontSize: 32.0, color: Colors.amberAccent);
  }
  static TextStyle titleBoldBlack(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.bold , fontFamily: 'Poppins-Bold', fontSize: 42.0, color: Color(AHColors.ahBackgroundBlue));
  }
  static TextStyle subtitle20(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.bold, fontFamily: 'Poppins-Bold', fontSize: 18.0, color: Color(AHColors.ahBackgroundBlue));
  }
  static TextStyle subtitle14(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.bold, fontFamily: 'Poppins-Bold', fontSize: 14.0, color: Color(AHColors.ahBackgroundBlue));
  }
}