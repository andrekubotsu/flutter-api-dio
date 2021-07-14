import 'package:desafio_api/modules/home/home_controller.dart';
import 'package:desafio_api/shared/widgets/post_list_tile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getPosts();
    controller.listen(
      (status) => {
        if (status == HomeStatus.success)
          {
            setState(
              () {},
            ),
          }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: controller.status == HomeStatus.success
          ? ListView.builder(
              itemCount: controller.posts.length,
              itemBuilder: (_, index) => PostListTileWidget(
                post: controller.posts[index],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
