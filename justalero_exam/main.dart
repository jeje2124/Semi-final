import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp())
}

class Myapp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      )
    home: HomePage
    )
  }
}