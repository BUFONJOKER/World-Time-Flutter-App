import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  runApp( MaterialApp(
    initialRoute: "/loading",
    routes:{
      '/home': (context)=> const Home(),
      '/location': (context)=> const ChooseLocation(),
      '/loading': (context)=> const LoadingBar(),
    },
  ));
}

