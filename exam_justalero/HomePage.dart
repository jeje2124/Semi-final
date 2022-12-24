import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List list = <dynamic> [];

  @override
  void initState(){
    super.initState();
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          final item = list[index] as Map;
          return Dismissible(
            key: ValueKey(item[index]),
            background: slideLeftBackground(),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                final bool res = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "Delete Todo ${list[index]['title']}?"),
                        actions: <Widget>[
                          FloatingActionButton(
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                list.removeAt(index);
                              }
                              );
                              Navigator.of(context).pop();
                            },
                          ),

                        ],
                      );
                    }
                );
                return res;
              } else {
                setState(() {
                  (item);
                }
                );
              }
              return null;
            },
            child: ListTile(
              leading: Text('${index + 1}'),
              title: Text(list[index]['title'],
                style : const TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(list[index]['body']),

            ),
          );
        },
      ),

    );
  }
  Future<void> deleteTodo(String id) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      final filtered = list.where((e) => e['_id'] != id).toList();
      setState(() {
        list = filtered;
      }
      );
    }
    getTodos();
  }

  Future <void> getTodos() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    setState(() {
      list = convert.jsonDecode(response.body) as List;
    }
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Icon(
              Icons.delete,
              color: Colors.black,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }

}