import 'package:flutter/material.dart';
import 'dart:developer';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Object? data;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments;
    log(data.toString());

    return  Scaffold(

      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,

      ),
      body: Column(

        children: <Widget>[

          TextButton.icon(
            onPressed:(){
              Navigator.pushNamed(context, '/location');
            },
            icon: const Icon(Icons.edit_location),
            label: const Text('Choose Location Screen'),
          ),
        ],
      )

    );
  }
}
