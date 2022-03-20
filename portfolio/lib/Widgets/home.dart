// main container of the screen is placed here
// then it will be called in the main.dart
import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/HomeContent.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // create container with blue background no text
    return MaterialApp(
      title: 'Gallery app',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('In-Game photo Gallery'),
        ),
        // this will be dynamic, will contain different pages, albums, and images
        body: Container(
          child:  Center(
            child: SizedBox(child: AlbumListWidget()),
          ),
        ),
      ),
    );
  }
}



