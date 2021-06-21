import 'package:example_4/pages/Attachments_Choose.dart';
import 'package:example_4/pages/HomePage.dart';
import 'package:flutter/material.dart';

/*
FilePickerResult? result = await FilePicker.platform.pickFiles(
type: FileType.custom,
allowedExtensions: ['jpg', 'pdf', 'doc'],
);
 */
class Attachments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('BILAGOR'),
              Text('Har du tagit bilder eller video på det inträffade?'),
              TextButton(
                onPressed: () {

                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new Attachments_Choose())
                  );
                },
                child: Text('VÄLJ FIL'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('NÄSTA'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

