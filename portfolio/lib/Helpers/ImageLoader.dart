import 'dart:async';
import 'package:universal_io/io.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class ImageLoader
{
  // string of asset gallery
  String galleryPath = "assets/gallery/Elden Ring/";
  // create a map of images sorted by folder

  // map of images sorted by folder (For future uses, try to use Dynamic Data from a source)
  List<Map<String, List<String>>> mappedImages = [{
    "Elden Ring":["assets/gallery/Elden Ring/00.jpg","assets/gallery/Elden Ring/01.jpg","assets/gallery/Elden Ring/02.jpg",
      "assets/gallery/Elden Ring/03.jpg","assets/gallery/Elden Ring/04.jpg"],
  }];

  // CheckDirectoryIfExist
  Future<List<String>> retrieveFromDirectory(String directoryPath) async
  {
    Directory directory = Directory(directoryPath);
    var subFolderName =  await directory.list().elementAt(1);

    var subFolder =   Directory(subFolderName.path);
    var subFolderContentLength = await subFolder.list().length;
    List<String> pathList = [];
    for (int i = 0; i < subFolderContentLength; i++)
    {
      var x = await subFolder.list().elementAt(i);
      pathList.add(x.path);
      print(pathList);
    }


    return Future.delayed((const Duration(milliseconds: 500)), () => pathList);
  }

  //replace character in a string

}