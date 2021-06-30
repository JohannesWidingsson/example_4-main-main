



/*
import 'dart:io';

import 'package:example_4/pages/Camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

//här väljer man foto från biblioteket
//knapp som leder till attachments confirm

class Attachments_Choose extends StatefulWidget {

  @override
  Attachments_ChooseState createState() => Attachments_ChooseState();
}

class Attachments_ChooseState extends State<Attachments_Choose> {
  static List<String> attachments = [];




  File ?_image;
  File? imageFile;
  final picker = ImagePicker();


  Future getImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {


      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
      else {
        print('No image selected.');
      }
    });
  }


  void _openImagePicker() async {
    final picker = ImagePicker();

    PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }





//Get from Gallery

  _getFromGallery() async {
    PickedFile ?pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,

    );

    setState(() {
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
      });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4E2),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[

/*
              _image == null
                  ? Text('No image selected.')
                  : Image.file(_image!),

*/


              Text('BILAGOR'),
              Text('Har du tagit bilder eller video på det inträffade?'),

              TextButton(
                onPressed: _openImagePicker,
                child: Text('VÄLJ FIL'),
              ),

             /*  IconButton(
                icon: Icon(Icons.attach_file),
                onPressed: _openImagePicker,
              ), */

              /*TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/UserInfo');
                },
                child: Text('KLAR'),
              ),*/




           /*   TextButton(
                onPressed: () =>
                    Navigator.pushNamed(
                      context,
                      "/Camera",
                    ),
                child: Text('Ta Bild'),
              ) */
            ],
          ),
        ),
      ),
    );
  }
}
*/