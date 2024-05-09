import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escooters Home'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add your menu button functionality here
          },
        ),
        actions: [
          Image.asset(
            'assets/emotion-76.png',
            width: 40,
            height: 40,
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Escooters Home Page!'),
      ),
    );
  }
}
