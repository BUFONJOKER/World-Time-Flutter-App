import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';

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
      String offset = data['utc_offset'];
      // Parse the string into a DateTime object
      DateTime dateTime = DateTime.parse(datetime);

      // Parse the offset string and extract hours and minutes
      int hours = int.parse(offset.substring(1, 3)); // Extract hours
      int minutes = int.parse(offset.substring(4, 6)); // Extract minutes

      // Create a Duration using the parsed hours and minutes
      Duration timeOffset = Duration(hours: hours, minutes: minutes);

      // Adjust the DateTime by adding the offset
      DateTime adjustedDateTime = dateTime.add(timeOffset);

      // Format the adjusted DateTime object into a 12-hour time format
      String formattedTime = DateFormat('hh:mm a').format(adjustedDateTime);

       // Output the formatted time with the offset
      int hour = int.parse(datetime.substring(11,13));

      isDayTime = hour > 6 && hour < 20  ? true : false;

      time = formattedTime;

    } on Exception catch (e) {
      log('caught error: $e');
    }
  }
}