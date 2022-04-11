import 'dart:convert';

import 'package:foodapp/post_model.dart';
// import 'package:hello/post_model.dart';
import 'package:http/http.dart' as http;

Future<List<Posts>> fetchPosts() async {
  List<Posts> post= <Posts>[];
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response = await http.get(url);
  // ignore: avoid_print
  // print(response.body);
  var decodedData = jsonDecode(response.body);

// ignore: avoid_print
  print(decodedData);
  decodedData.forEach((e) {
    post.add(Posts.fromJson(e));
    // ignore: avoid_print
    print(post);
    // ignore: avoid_print
  });
  return post;
}
