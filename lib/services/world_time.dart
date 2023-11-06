import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer';

class WorldTime{
  String? location; // location name for the UI
  String? time; // the time in that location
  String? flag; // url to an asset flag icon
  String? url; // location url for api endpoint
  bool? isDayTime; // true or false if daytime or not
  WorldTime({this.location, this.flag, this.url});
  Future<void> getTime() async {
    try {
      Response  response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // log(data.toString());
      // get properties from data
      String datetime = data['datetime'];
      // log(datetime);
      // log(offset);
      // create DateTime object
      // log('now $now');
      int hour = int.parse(datetime.substring(11,13));
      isDayTime = hour > 6 && hour < 20  ? true : false;
      // log(now.toString());
      // time = DateFormat.jm().format(now);
      int checkTime = datetime.substring(11,16).compareTo("12:00");
      // log('checkTime $checkTime');
      if(checkTime != 1){
        int hour = int.parse(datetime.substring(11,13));
        time = '$hour${datetime.substring(13,16)} AM';
      }
      else{
        int change24hourTo12 = int.parse(datetime.substring(11,13));
        change24hourTo12 = change24hourTo12 - 12;
        // String string = number.toString();
        time = '$change24hourTo12${datetime.substring(13,16)} PM';
      }
    } on Exception catch (e) {
      log('caught error: $e');
    }
  }
}