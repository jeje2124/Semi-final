import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() =>  _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List todo = <dynamic> [];

  @override
  void initState(){
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
      title:const Text('Todo lister'),
      ),
      body: ListView.builder(
        itemCount: todo.length,
          itemBuilder:(context, index),
      ),
    );
  }
}