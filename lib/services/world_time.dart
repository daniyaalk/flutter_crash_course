import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for UI
  String time; // time at location
  String flag; // url to asset flag icon
  String url; // location url for API
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      //Get Properties from data
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'];
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));

      isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error: $e");
      time = "There was an error in fetching time.";
    }
  }
}
