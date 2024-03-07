import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String url;
  late String flag;
  late bool isDatetime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String utc = data['utc_offset'].substring(1, 3);
      // print(time);
      // print(utc);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utc)));
      time = DateFormat.jm().format(now);
      isDatetime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print('Caught $e');
    }
  }
}