import 'package:desafio_api/modules/home/home_controller.dart';
import 'package:desafio_api/modules/home/home_repository.dart';
import 'package:desafio_api/shared/widgets/post_list_tile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List posts = [];

  final controller = HomeController();

  final repository = HomeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              posts.length,
              (index) => Card(
                child: PostListTileWidget(post: posts[index]),
              ),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () async {
                await controller.getPosts();
                posts = controller.posts;
                controller.listen((status) {
                  print(status);
                });
                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Clique aqui p/ baixar os dados ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                posts = [];
                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Limpar tela ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
