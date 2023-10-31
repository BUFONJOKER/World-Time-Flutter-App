import 'dart:developer';

import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  var counter = 0;

  @override
  initState(){
    super.initState();
    log('initState function ran');
  }

  @override
  Widget build(BuildContext context) {
    log('build function run $counter times');
    return Scaffold(

      appBar: AppBar(
        title: const Text('Choose a Location'),
        centerTitle: true,

      ),

      body:TextButton(

            onPressed: (){
              setState(() {
                counter += 1;
              });
            },

            style: TextButton.styleFrom(

              backgroundColor: Colors.black,
            ),
            child: Text(
                "Counter $counter",
                  style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
            ),
        )

    );
  }
}
