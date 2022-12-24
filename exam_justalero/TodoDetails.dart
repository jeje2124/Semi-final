import 'package:flutter/material.dart';

class TodoDetails extends StatefulWidget {
  final dynamic todo;

  const TodoDetails({
    required this.todo,
    Key? key
  }
      ) : super(key: key);

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  Widget rowItem(String title, dynamic value) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(title),
        ),
        const SizedBox(width: 5),
        Text(value.toString())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Details"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            textColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 4,
                  child: Text('Title:'),
                ),
                Expanded(
                  flex: 9,
                  child: Text(widget.todo["title"] as String),
                ),

              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          ListTile(
            textColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Expanded(
                  flex: 4,
                  child: Text('Description:'),
                ),
                Expanded(
                  flex: 9,
                  child: Text(widget.todo["body"] as String),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}