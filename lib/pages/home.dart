import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.black87,
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
