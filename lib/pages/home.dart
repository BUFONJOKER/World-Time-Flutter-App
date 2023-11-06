import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String backgroundImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? backgroundColor = data['isDayTime'] ? Colors.blue : Colors.black54;
    String? appBar = data['isDayTime'] ? 'Day Time' : 'Night Time';
    return  Scaffold(
        appBar: AppBar(
          title:  Text(appBar),
          centerTitle: true,
          backgroundColor: backgroundColor,
      ),
        body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$backgroundImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed:() async {
                    var result = await Navigator.pushNamed(context, '/location') as Map<String, dynamic>;
                    setState((){
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime'],
                      };
                    });
                  },
                  icon: const Icon(Icons.edit_location),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  label: const Text(
                      'Edit Location',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                Text(
                  data['location'],
                  style: const TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30.0,),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 60.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
