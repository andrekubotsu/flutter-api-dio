import 'package:desafio_api/modules/home/home_controller.dart';
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
                child: ListTile(
                  leading: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.orange.shade600,
                    ),
                    child: Center(
                      child: Text(
                        posts[index].id.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  title: Text(posts[index].title),
                ),
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
                posts = await controller.getPosts(posts);
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
