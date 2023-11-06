import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer';

class WorldTime{

  String? location; // location name for the UI
  String? time; // the time in that location
  String? flag; // url to an asset flag icon
  String? url; // location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response  response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // log(data.toString());

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // log(datetime);
      // log(offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // log(now.toString());
      time = now.toString();

    } on Exception catch (e) {

      log('caught error: $e');
      time = "could not get time data";
    }
  }
}