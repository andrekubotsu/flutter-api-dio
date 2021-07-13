import 'dart:convert';

import 'package:desafio_api/shared/custom_dio/custom_dio.dart';

import 'package:desafio_api/shared/models/post.dart';

class HomeController {
  Future getPosts(posts) async {
    final client = CustomDio();

    final response = await client.get("/posts");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.data) as List;
      posts = json.map((e) => Post.fromJson(e)).toList();

      return posts;
    }
  }
}
