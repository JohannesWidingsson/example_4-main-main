import 'dart:convert';
import 'dart:io';
import 'package:example_4/pages/Attachments_Choose.dart';
import 'package:example_4/pages/HomePage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
class AttachmentsTest extends StatefulWidget {
  @override
  AttachmentsTestState createState() => AttachmentsTestState();
}
class AttachmentsTestState extends State<AttachmentsTest> {
  //static List<String> attachments = [];
  static List<Asset> images = <Asset>[];
  static List<String> attachments = [];
  @override
  void initState() {
    super.initState();
  }
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;
    if(resultList != null){
      setState(() {
        images = resultList;

        // _error = error;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4E2),
      appBar: AppBar(
        title: Text('Rapportera'),
        backgroundColor: Color(0xFF555849),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          //PopupMenuButton(itemBuilder: itemBuilder)
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 490.0,
                width: 800,
                decoration: BoxDecoration(
                  color: Color(0xFFA8AE8E),
                  /*borderRadius: BorderRadius.vertical(
                       bottom: Radius.elliptical(920, 400),
                    ),*/
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 225.0),
                    /*  bottomLeft: Radius.circular(180.0), Radius.Vertical(),
                      bottomRight: Radius.circular(180.0)*/
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF707070).withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 16, 20, 16),
                      child: Text(
                        'BILAGOR',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'gunplay',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 16, 20, 16),
                      child: Text(
                        'Har du tagit bilder eller video på det inträffade?',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 0, 30, 0),
                      child: Container(
                        height: 200.0,
                        width: 330,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF707070).withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(16, 30, 16, 60),
                                child: Text(
                                    'Bifoga video eller bild till ditt meddelande\n(Max xx Mb) eller tyck Nästa för att \n hoppa över detta steg.'),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(20, 0, 80, 0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        loadAssets();
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                new Attachments_Choose()));
                                      },
                                      child: Text(
                                        'VÄLJ FIL',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF707070),
                                          fontSize: 14,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(10, 0, 20, 0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                new Attachments_Choose()));
                                      },
                                      child: Text(
                                        'NÄSTA',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF707070),
                                          fontSize: 14,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}