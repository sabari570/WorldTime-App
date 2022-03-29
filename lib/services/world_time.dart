import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;
  WorldTime({
    this.location,
    this.time,
    this.flag,
    this.url,
  });

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offset.substring(1, 3)),
          minutes: int.parse(offset.substring(4))));
      isDaytime = (now.hour > 6 && now.hour < 18) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Exception Occured: $e');
      time = 'Could not update time!!';
    }
  }
}
