import 'package:desafio_api/shared/custom_dio/custom_dio.dart';
import 'package:desafio_api/shared/models/post.dart';

class HomeRepository {
  final client = CustomDio();

  Future getPosts() async {
    final response = await client.get("/posts");

    if (response.statusCode == 200) {
      final json = response.data as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();

      return posts; // retorna o dado legível
    } else {
      return [];
    }
  }
}
