import 'package:flutter/material.dart';

import '../Helpers/ImageLoader.dart';
import '../Helpers/StringHelper.dart';

// create a dynamic listview widget
// listview widget with a dynamic list of items

class AlbumListWidget extends StatefulWidget {
  const AlbumListWidget({Key? key}) : super(key: key);

  @override
  State<AlbumListWidget> createState() => _AlbumListWidgetState();
}

class _AlbumListWidgetState extends State<AlbumListWidget> {
  ImageLoader imageLoader = ImageLoader();
  List<String> imagePathList = [];

  @override
  void initState() {
    // load the images
    loadImages();
    super.initState();
  }

  void loadImages() async {
    var images =
        await imageLoader.checkDirectoryIfExist(imageLoader.galleryPath);
    print("Images " + images[1]);
    setState(() {
      // edit imagePathList
      for(var image in images) {
        print("Image " + StringHelper().replaceCharacter(image, '\\', '/'));
        imagePathList.add(StringHelper().replaceCharacter(image, '\\', '/'));
      }
      print(imagePathList);
    });
  }

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    var stringText = "Photos taken from different games";
    return Container(color: Color(0x95B4B4B4),
      width: MediaQuery.of(context).size.width, // width of the screen
      height: MediaQuery.of(context).size.height, // height of the screen
      child: ScrollConfiguration( behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: imagePathList.length +1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0 ) {
                return SizedBox(
                  height: 150,
                  child: Center(
                    child: Text(
                      stringText,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: ImageContainerWidget(
                  index: index,imagePath: imagePathList[index-1],imageGalleryTitle: "Elden Ring",
                )),
              );
            },

            ),
      ),

    );
  }
}

class ImageContainerWidget extends StatefulWidget {
  final int index;
  final String imagePath;
  final String imageGalleryTitle;
  ImageContainerWidget(
      {Key? key,
      this.index = 0,
      this.imagePath =
          "https://live.staticflickr.com/3780/9134266649_3d2f1af95b_z.jpg",
      this.imageGalleryTitle = "Untitled"})
      : super(key: key);

  @override
  State<ImageContainerWidget> createState() => _ImageContainerWidgetState();
}

class _ImageContainerWidgetState extends State<ImageContainerWidget> {
  @override
  Widget build(BuildContext context) {
    // return container with one row with two columns
    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = 400;

    Widget imageContainer = Container(
        width: containerWidth,
        height: containerHeight,
        child: Container(
          margin: EdgeInsets.fromLTRB(
              containerWidth * .2, 0, containerWidth * .2, 0),
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(0),
            child: Row(children: [
              // every even number reverse it
              SizedBox(
                width: 700,
                  child: new Image.asset(widget.imagePath,
                      fit: BoxFit.cover,
                      height: containerHeight,
                      width: containerWidth)
              ),
              Expanded(
                flex: 1,
                child: Container( color: Colors.white,
                  width: 400,
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(widget.imageGalleryTitle,
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
    Widget reversedImageContainer = SizedBox(
        width: containerWidth,
        height: containerHeight,
        child: Container(
          margin: EdgeInsets.fromLTRB(
              containerWidth * .2, 0, containerWidth * .2, 0),
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(0),
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Container(color: Colors.white,
                  width: 400,
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(widget.imageGalleryTitle,
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: 700,
                  child: new Image.asset(widget.imagePath,
                      fit: BoxFit.cover,
                      height: containerHeight,
                      width: containerWidth)
              ),
            ]),
          ),
        ));

    var trueIndex = widget.index - 1;

    // create a card image widget

    return trueIndex % 2 == 0 ? imageContainer : reversedImageContainer;
  }
}
