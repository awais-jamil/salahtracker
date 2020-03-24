import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/resources/colors.dart';
import 'package:myflutterapp/resources/textTheme.dart';
import 'package:myflutterapp/screens/calendarScreen.dart';
import '../models/prayer.dart';
import '../bloc/homeBloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchTimes();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: new BoxDecoration(color: Color(AHColors.ahBackgroundColor)),
              child: Center(
                child: Text("Prayer Tracker", style: CustomTextStyle.titleBold36(context)),
              ),
            ),
            ListTile(
              title: Text("Home", style: CustomTextStyle.subtitle20(context)),
            ),
            ListTile(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarScreen()));
              },
              title: Text("Qaza Calender", style: CustomTextStyle.subtitle20(context)),
            ),
            ListTile(
              title: Text("Settings", style: CustomTextStyle.subtitle20(context)),
            ),
            ListTile(
              title: Text("Visit Developer", style: CustomTextStyle.subtitle20(context)),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: timerCard(),
          ),

          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            top: 170.0,
            child: prayerLayout(),
          ),
        ],
      )
    );
  }

  Widget timerCard(){
     return Container(
        decoration: new BoxDecoration(color: Color(AHColors.ahBackgroundColor)),
        child:  Column(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[

             SizedBox(height: 20,),

             Row(
               mainAxisSize: MainAxisSize.max,
               children: <Widget>[
                 SizedBox(width: 30,),
                 Text('Time Left in:', style: CustomTextStyle.title(context)),
                 SizedBox(width: 10,),
                 Card(
                   clipBehavior: Clip.antiAlias,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(8.0)),
                   color: Colors.white,
                   child: Container(
                     margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                     child: Text('Asar', style: CustomTextStyle.subtitleBlack(context)),
                   ),
                 )
               ],
             ),
             SizedBox(height: 10,),
             Card(
               margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 5.0),
               clipBehavior: Clip.antiAlias,
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(8.0)),
               color: Colors.white,
               child: Center(
                 child: Container(
                   margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                   child: Text(timerString, style: CustomTextStyle.titleBoldBlack(context)),
                 ),
               ),
             ),
             SizedBox(height: 150,)
           ],
         )
     );
  }

  Widget prayerLayout(){
    return  Container(
          decoration: new BoxDecoration(color: Colors.white, borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
          ),
          child:  StreamBuilder(
            stream: bloc.allTimes,
            builder: (context, AsyncSnapshot<Prayer> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    prayerCard("Fajr", snapshot.data.fajr),
                    prayerCard("Zuhar", snapshot.data.dhuhr),
                    prayerCard("Asr", snapshot.data.asr),
                    prayerCard("Maghrib", snapshot.data.maghrib),
                    prayerCard("Isha", snapshot.data.isha),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
    );
  }

  Widget prayerCard(String name, String time){
    return Container(
        margin: new EdgeInsets.fromLTRB(10, 0, 10, 15),
        width: 25.0,
        height: 85.0,
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 50.0,
          ),
        ]),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.amber,
                width: 10,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('testing');
                    controller.stop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      new Text(
                        name, style: CustomTextStyle.titleBlack(context)
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                              time, style: CustomTextStyle.subtitle20(context)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

}