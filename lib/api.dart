// https://github.com/umarhamza/hacker-news/blob/main/src/services/api.js

class Api {
  static  itemUrl(int storyId) {
    return "https://hacker-news.firebaseio.com/v0/item/${storyId}.json?print=pretty";
  }

  static  topStoriesUrl() {
    return "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";
  }

  static  commentUrl(int commentId) {
    return "https://hacker-news.firebaseio.com/v0/item/${commentId}.json?print=pretty";
  }
}
