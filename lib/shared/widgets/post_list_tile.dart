import 'package:desafio_api/shared/models/post.dart';
import 'package:flutter/material.dart';

class PostListTileWidget extends StatelessWidget {
  final Post post;
  const PostListTileWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title!),
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.orange.shade600,
          ),
          child: Center(
            child: Text(
              post.id.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
