import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Text(
          'Choose a Location',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
