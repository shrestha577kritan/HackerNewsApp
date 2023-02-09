import 'dart:convert';
import 'package:hackernewapp/api.dart';
import 'package:hackernewapp/models/comment_story_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NewsService {
  Future<Response> _getStory(int storyId) {
    return http.get(Uri.parse(Api.itemUrl(storyId)));
  }

  Future<List<Response>> getComments(Story story) async {
    return Future.wait(story.commentId.map((commentId) {
      return http.get(Uri.parse(Api.commentUrl(commentId)));
    }));
  }

  Future<List<Response>> topStories() async {
    final response = await http.get(Uri.parse(Api.topStoriesUrl()));
    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);
      return Future.wait(storyIds.take(25).map((storyId) {
        return _getStory(storyId);
      }));
    } else {
      throw Exception('Fetching Data error!');
    }
  }
}
