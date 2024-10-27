import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage(),);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load Json'),
      ),
      body: Center(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/person.json'),
          builder: (context, snapshot) {
            var myData = json.decode(snapshot.data.toString());

            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Name: ' + myData[index]['name']),
                    Text('Email: ' + myData[index]['email']),
                    Text('Age: ' + myData[index]['age'].toString()),
                    Text('City: ' + myData[index]['city']),
                    Text('Occupation: ' + myData[index]['occupation']),
                  ],
                ));
              },
              itemCount: myData == null ? 0 : myData.length,
            );
          },
        ),
      ),
    );
  }
}
