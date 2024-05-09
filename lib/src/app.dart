import 'package:flutter/material.dart';
import 'package:emotion/src/features/home/presentation/widgets/home_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), 
    );
  }
}
