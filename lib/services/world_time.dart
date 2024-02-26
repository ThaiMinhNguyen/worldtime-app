import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location;
  late String time;
  late String url;
  late String flag;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String utc = data['utc_offset'].substring(1,3);
    // print(time);
    // print(utc);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(utc)));
    time = now.toString();
  }
}