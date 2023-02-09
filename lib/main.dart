import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'view/top_story_page.dart';


void main() async {
 
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hacker News App',
      theme: ThemeData.dark(),
      home: TopStories(),
    );
  }
}
