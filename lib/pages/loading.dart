import 'package:flutter/material.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({super.key});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Loading Screen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Text(
          'Loading...',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
