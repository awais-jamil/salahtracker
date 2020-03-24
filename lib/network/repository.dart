import 'dart:async';
import 'package:myflutterapp/models/prayer.dart';
import 'package:myflutterapp/network/prayerProvider.dart';

class Repository {
  final prayerApiProvider = PrayerApiProvider();

  Future<Prayer> fetchTimes() => prayerApiProvider.fetchTimesList();
}