import 'package:emotion/src/features/home/presentation/widgets/home_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'E-Motion',
      debugShowCheckedModeBanner: false,
      home: HomePage(), 
    );
  }
}
