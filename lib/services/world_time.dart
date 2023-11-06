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

      // get properties from data
      String datetime = data['datetime'];

      // Parse the string into a DateTime object
      DateTime dateTime = DateTime.parse(datetime);
      String timeDATE = datetime.substring(11,16);
      // Output the formatted time with the offset
      int hour = int.parse(datetime.substring(11,13));

      if(hour == 0){
        timeDATE = '12:${timeDATE.substring(3,5)} AM';
      }
      else if(hour==12){
        timeDATE = '12:${timeDATE.substring(3,5)} PM';
      }
      else if(hour>12){
        timeDATE = '${hour-12}:${timeDATE.substring(3,5)} PM';
      }

      else{
        timeDATE = '$hour:${timeDATE.substring(3,5)} AM';
      }
      isDayTime = hour > 6 && hour < 20  ? true : false;

      time = timeDATE;

    } on Exception catch (e) {
      log('caught error: $e');
    }
  }
}