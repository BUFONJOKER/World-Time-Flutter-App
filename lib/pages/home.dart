import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return  Scaffold(

      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200.0, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed:(){
                  Navigator.pushNamed(context, '/location');
                },
                icon: const Icon(Icons.edit_location),
                label: const Text(
                    'Edit Location',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),

              ),

              const SizedBox(height: 20.0,),

              Text(
                data!['location'],
                style: const TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 30.0,
                ),

              ),

              const SizedBox(height: 30.0,),

              Text(
                data!['time'],
                style: const TextStyle(
                  fontSize: 60.0,
                  color: Colors.red,
                ),
              ),

            ],
          ),
        ),
      )

    );
  }
}
