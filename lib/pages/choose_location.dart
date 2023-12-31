import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}
class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'pakistan.png'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'ksa.png'),
    WorldTime(url: 'Asia/Dhaka', location: 'Dhaka', flag: 'bangladesh.png'),
    WorldTime(url: 'Asia/Tehran', location: 'Tehran', flag: 'iran.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Africa/Algiers', location: 'Algiers', flag: 'algeria.png'),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag: 'morocco.png'),
    WorldTime(url: 'Asia/Kabul', location: 'Kabul', flag: 'afghanistan.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'korea.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'china.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    if(!mounted) return;
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }
  @override
  initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount:locations.length,
            itemBuilder: (context,index){
              String? location = locations[index].location;
              String? flag = locations[index].flag;
              return Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(location!),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/$flag'),
                  )
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
