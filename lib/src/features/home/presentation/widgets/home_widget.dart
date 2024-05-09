import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escooters Home'),
      ),
      body: const Center(
        child: Text('Welcome to the Escooters Home Page!'),
      ),
    );
  }
}