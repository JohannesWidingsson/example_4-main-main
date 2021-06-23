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
        title: Text('Rapportera'),
        backgroundColor: Color(555849),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: MyCustomForm(),
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
    return Scaffold(
      backgroundColor: Color(0xFFF5F4E2),
      body: Center(
        child: SafeArea(
          child: new Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: const EdgeInsets.fromLTRB(35, 16, 0, 16),
                      child: Text(
                        'HÄNDELSE',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'gunplay',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(35, 16, 20, 16),
                        child: Text(
                          'Beskriv så tydligt som möjligt vad som hänt eller vad du sett',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                      child: Container(
                        height: 250.0,
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
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: SizedBox(
                                  height: 170,
                                  child: TextField(
                                    controller: textController,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Din beskrivning...',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(200, 0, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                new Attachments()));
                                  },
                                  child: Text(
                                    'Nästa',
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'lib/assets/mink3.png',
                          width: 80.0,
                          height: 55.0,
                          fit: BoxFit.cover,
                          color: Color(0xFF555849),
                        ),


                        // Mink137 stylen.
                        Text(
                          'MINK137',
                          style: TextStyle(
                            fontFamily: 'gunplay',
                            fontSize: 40,
                            color: Color(0xFF555849),
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
