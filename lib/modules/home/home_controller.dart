import 'package:desafio_api/modules/home/home_repository.dart';
import 'package:desafio_api/shared/models/post.dart';

enum HomeStatus { empty, loading, success, error }

class HomeController {
  final repository = HomeRepository();
  Function(HomeStatus status)? _onListen;
  var posts = <Post>[];
  var status = HomeStatus.empty;

  Future<void> getPosts() async {
    status = HomeStatus.loading;
    final response = await repository.getPosts();
    posts = response;
    status = HomeStatus.success;
  }

  void update(HomeStatus status) {
    this.status = status;
    if (_onListen != null) {
      _onListen!(this.status);
    }
  }

  void listen(Function(HomeStatus status) onChange) {
    _onListen = onChange;
  }
}
