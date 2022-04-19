import 'dart:convert';

import 'package:flutter_app_test/testingmodal.dart';
import 'package:http/http.dart';

class service {
  final String URL = "https://jsonplaceholder.typicode.com/todos/";
  Future<List<User>> getPosts() async {
    Response res = await get(Uri.parse(URL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> posts = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
