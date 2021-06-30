import 'package:example_4/pages/Location.dart';
import 'package:flutter/material.dart';
import 'package:example_4/pages/Location.dart';
import 'package:example_4/pages/DateTime.dart';

class LocationChoosen extends StatelessWidget {
  TextEditingController location = LocationChooserState.lane1;
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

        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Wrap(
                children: <Widget>[
                  Container(
                    height: 490.0,
                    width: 800,
                    decoration: BoxDecoration(
                      color: Color(0xFFA8AE8E),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 225.0),
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
                          padding: const EdgeInsets.fromLTRB(35, 16, 35, 16),
                          child: Text(
                            'PLATS',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'gunplay',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(35, 16, 35, 16),
                            child: Text(
                              'Var hände det som du vill rapportera?',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
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
                                    const EdgeInsets.fromLTRB(16, 30, 16, 40),
                                    child: Text(
                                      ' Du har angett position:   \n ' + location.text ,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF707070),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                    new LocationScreen()));
                                          },
                                          child: Text(
                                            'ÄNDRA',
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
                                        const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                    new MyHomePage()));
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
            ],
          ),
        ),
      ),
    );
  }
}

