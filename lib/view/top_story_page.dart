import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackernewapp/models/comment_story_model.dart';
import 'package:hackernewapp/services/news_services.dart';
import 'package:hackernewapp/view/comment_page.dart';

class TopStories extends StatefulWidget {




  @override
  State<TopStories> createState() => _TopStoriesState();
}

class _TopStoriesState extends State<TopStories> {
  List<Story> _stories = [];

  void initState() {
    super.initState();
    _TopStories();
  }

  void _TopStories() async {
    final response = await NewsService().topStories();
    final stories = response.map((response) {
      final json = jsonDecode(response.body);
      return Story.fromJson(json);
    }).toList();

    setState(() {
      _stories = stories;
    });
  }

  void _showComment(BuildContext context, int index) async {
    final story = this._stories[index];
    final response = await NewsService().getComments(story);
    final comments = response.map((e) {
      final data = jsonDecode(e.body);
      return Comment.fromJson(data);
    }).toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CommentPage(story: story, comments: comments,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Top News',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: _stories.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            dense: true,
            selectedColor: Colors.red,
            title: Text(
              _stories[index].title,
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.grey[300]),
            ),
            subtitle: Row(
              children: [
                

                InkWell(
                  focusColor: Colors.red,
                    hoverColor: Colors.red,
                    onTap: () {
                      _showComment(context, index);
                    },
                    child: Text(
                      ' ${_stories[index].commentId.length} comments',
                      style: TextStyle(color: Colors.grey[400], fontSize: 15,fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
