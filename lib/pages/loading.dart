import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'dart:developer';


class LoadingBar extends StatefulWidget {
  const LoadingBar({super.key});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {

  String time = "loading";

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: "Berlin", flag: "germany.png", url: "Asia/Karachi");
    await instance.getTime();
    setState(() {
      time = instance.time.toString();
    });
    log(instance.time.toString());
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
      body:  Center(
        child: Text(
          time,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
