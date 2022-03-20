import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class ImageLoader
{
  // string of asset gallery
  String galleryPath = "assets/gallery/";

  // CheckDirectoryIfExist
  Future<List<String>> checkDirectoryIfExist(String path) async
  {
    Directory directory = Directory(path);
    var subFolderName =  await directory.list().elementAt(1);

    var subFolder =   Directory(subFolderName.path);
    var subFolderFiles = await  subFolder.list().elementAt(0);
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