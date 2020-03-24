import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/resources/colors.dart';
import 'package:myflutterapp/resources/textTheme.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> with TickerProviderStateMixin{
  CalendarController _calendarController;
  Map<DateTime, List> _events;
  List _selectedEvents;
  Map<DateTime, List> _holidays;

  @override
  void initState() {
    super.initState();

    _calendarController = CalendarController();

    final _selectedDay = DateTime.now();

    _holidays = {
      DateTime(2020, 1, 1): ['New Year\'s Day'],
      DateTime(2019, 1, 6): ['Epiphany'],
      DateTime(2019, 2, 14): ['Valentine\'s Day'],
      DateTime(2019, 4, 21): ['Easter Sunday'],
      DateTime(2019, 4, 22): ['Easter Monday'],
    };

    _events = {
      _selectedDay.subtract(Duration(days: 30)): ['Event A0', 'Event B0', 'Event C0'],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): ['Event A2', 'Event B2', 'Event C2', 'Event D2'],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): ['Event A4', 'Event B4', 'Event C4'],
      _selectedDay.subtract(Duration(days: 4)): ['Event A5', 'Event B5', 'Event C5'],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): ['Event A8', 'Event B8', 'Event C8', 'Event D8'],
      _selectedDay.add(Duration(days: 3)): Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): ['Event A10', 'Event B10', 'Event C10'],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): ['Event A12', 'Event B12', 'Event C12', 'Event D12'],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): ['Event A14', 'Event B14', 'Event C14'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];

  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qaza Calendar"),
      ),
      body: Container(
//          decoration: new BoxDecoration(color: Color(AHColors.ahBackgroundColor)),
          child: new Column(
            children: <Widget>[
              SizedBox(height: 15,),
              _buildTableCalendarMarker(),
              _buildEventList()
            ],
          )
      ),
    );
  }

  Widget _buildTableCalendarMarker() {
    return  Container(
      margin:  EdgeInsets.only(left: 15.0, right: 15.0),
      decoration: new BoxDecoration(color: Colors.amberAccent, borderRadius: new BorderRadius.only(
        topLeft:  Radius.circular(5.0),
        topRight:  Radius.circular(5.0),
        bottomRight:  Radius.circular(5.0),
        bottomLeft:  Radius.circular(5.0),
      ),
      ),

      child: TableCalendar(
          calendarController: _calendarController,
          headerVisible: true,
          events: _events,
          holidays: _holidays,
          onDaySelected: _onDaySelected,
          onVisibleDaysChanged: _onVisibleDaysChanged,
          headerStyle: HeaderStyle(centerHeaderTitle: true, titleTextStyle: CustomTextStyle.subtitle(context), rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white), leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white), formatButtonVisible: true),
          calendarStyle: CalendarStyle(markersColor: Colors.white, weekdayStyle: CustomTextStyle.subtitle14(context), weekendStyle: CustomTextStyle.subtitle14(context), holidayStyle:  CustomTextStyle.subtitle14(context), todayStyle: CustomTextStyle.subtitle14(context), selectedColor: Color(AHColors.ahBackgroundLightBlue), todayColor: Color(AHColors.ahSlightlyLightBlueColor), outsideStyle: CustomTextStyle.subtitle14(context), outsideHolidayStyle: CustomTextStyle.subtitle14(context), outsideWeekendStyle: CustomTextStyle.subtitle14(context) ),
          daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: CustomTextStyle.subtitle14(context), weekendStyle: CustomTextStyle.subtitle14(context))
      ),
    );
  }

  Widget _buildEventList() {
    return  Expanded(
      child: ListView(
        children: _selectedEvents.map((event) => prayerCard(event.toString())).toList(),
      ),
    );
  }

  Widget prayerCard(String name){
    return Container(
        margin: new EdgeInsets.fromLTRB(10, 10, 10, 0),
        width: 25.0,
        height: 65.0,
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
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      new Text(
                          name, style: CustomTextStyle.subtitle14(context)
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

