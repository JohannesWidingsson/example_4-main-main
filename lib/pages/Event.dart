import 'dart:async';
import 'package:example_4/pages/Email.dart';
import 'package:example_4/pages/Attachments.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Beskriv Händelse';


    return Scaffold(


        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm()

    );

  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
 static TextEditingController textController = TextEditingController();
  //static String displayText = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(
            'HÄNDELSE',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text(
              'Beskriv så tydligt som möjligt vad som hänt eller vad du sett',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: SizedBox(
            height: 250,
            child: TextField(
             controller: textController,
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Din beskrivning...',
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {

            Navigator.push(context, new MaterialPageRoute(
                builder: (context) => new Attachments())
            );
          },
          child: Text('Nästa'),
        ),
      ],
    );
  }
}
