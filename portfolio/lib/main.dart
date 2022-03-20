import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/home.dart';

import 'Helpers/ImageLoader.dart';

void  main() async {
  ImageLoader imageLoader = ImageLoader();
  //print(await imageLoader.checkDirectoryIfExist(imageLoader.galleryPath));
  runApp(const HomePage());
  // runApp(const MyApp());
}

