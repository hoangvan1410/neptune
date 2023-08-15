import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'rooms.dart';
/// Flutter code sample for [DropdownButton].
List<String> list = <String>[];
void main() => runApp(run());
run(){
  foo();
}
void foo() async {
  var futureList = await fetchRooms();
  List<String> list = futureList;
}


List<Rooms> parseRooms(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Rooms>((json) => Rooms.fromMap(json)).toList();
}

Future<List<String>> fetchRooms() async {
  final response = await http.get(Uri.parse('http://192.168.1.29:5001/api/Schedule/list-room'));
  if (response.statusCode == 200) {
    var temp = parseRooms(response.body);
    var list = <String>[];
    temp.forEach((element) =>{list.add(element.nickname) });
    return list;
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
