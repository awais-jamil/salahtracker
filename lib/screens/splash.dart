import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/resources/colors.dart';
import 'package:myflutterapp/resources/textTheme.dart';
import 'package:myflutterapp/screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 2),
          () =>
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(title: "Prayer Tracker",))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color(AHColors.ahBackgroundColor)),
      child: new Center(
        child: Text("Prayer Tracker", style: CustomTextStyle.titleBold(context)),
      ),
    );
  }
}