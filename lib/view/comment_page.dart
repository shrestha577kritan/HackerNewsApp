import 'package:flutter/material.dart';
import 'package:hackernewapp/models/comment_story_model.dart';

class CommentPage extends StatelessWidget {
  final List<Comment> comments;
  final Story story;

  const CommentPage({super.key, required this.comments, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.story.title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: this.comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                this.comments[index].text,
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}
