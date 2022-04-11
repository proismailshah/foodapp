// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodapp/post_model.dart';


import 'fetch_data.dart';
// part 'new.dart';

// var mapData = [
//   {'name': 'John', 'age': '25'},
//   {'name': 'Jane', 'age': '26'},
// ];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void func() {
    setState(() {
      print('object');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sample Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Posts>> fetchedData;
  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  fetchDataFromServer() {
    fetchedData = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchDataFromServer();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: fetchedData,
          builder: (BuildContext context, AsyncSnapshot<List<Posts>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data![index].title!),
                      subtitle: Text(snapshot.data![index].body!),
                    );
                  },
                );
              }
            }
            return Text('${snapshot.error}');
          }),
    );
  }
}
