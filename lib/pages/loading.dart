import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({super.key});
  @override
  State<LoadingBar> createState() => _LoadingBarState();
}
class _LoadingBarState extends State<LoadingBar> {
  String time = "loading";
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: "Karachi", flag: "pakistan.png", url: "Asia/Karachi");
     await instance.getTime();
     if(!context.mounted) return;
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }
  @override
  void initState(){
    super.initState();
    setUpWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Loading Screen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child:  Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
          child: SpinKitFadingCircle(
            color: Colors.black,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
