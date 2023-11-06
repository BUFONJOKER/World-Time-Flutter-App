import 'dart:developer';

import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  var counter = 0;

  void getData () async {
    var name = await Future.delayed(const Duration(seconds: 1),(){
      return 'mani';
    });

    var age = await Future.delayed(const Duration(seconds: 1),(){
      return 24;
    });

    log('$name - $age');
  }

  @override
  initState(){
    super.initState();
    getData();
    log('initState function ran');
  }

  @override
  Widget build(BuildContext context) {

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
