/*import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

//sista sida med länkar till försvaret

//tillbaka knapp som leder till sidan innan (tack sidan)
class ExternLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Information_2');
                  },
                  child: Text('Tillbaka')
              ),
              Text('Test'),
              Container(
                  child: Hyperlink('https://www.youtube.com/', 'https://www.youtube.com/')),

            ],
          ),
        ),
      ),
    );
  }
}

class Hyperlink extends StatelessWidget {
  final String _url;
  final String _text;

  Hyperlink(this._url, this._text);

  _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        _text,
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      onTap: _launchURL,
    );
  }
}*/

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4E2),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 60, 40, 100),
                      child: RichText(
                        text: TextSpan(


                            children: [
                              new TextSpan(
                                text: 'Externa länkar till försvaret\n\n',
                                style: TextStyle(
                                  fontFamily: 'gunplay',
                                  fontSize: 24,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              new TextSpan(
                                text: '\nSvenska Marinen På Facebook: ',
                                style: new TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Roboto'),
                              ),
                              new TextSpan(
                                text:
                                '\n https://www.facebook.com/svfmmarinen/posts/204813238077540\n',
                                style: new TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Roboto'),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://www.facebook.com/svfmmarinen/posts/204813238077540');
                                  },
                              ),
                              new TextSpan(
                                text: '\n\n\n Försvarsmakten syds tipslinje: \n',
                                style: new TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Roboto'),
                              ),
                              new TextSpan(
                                text:
                                ' https://www.forsvarsmakten.se/sv/aktuellt/2016/09/militarregion-syds-tipslinje/',
                                style: new TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Roboto'),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://www.forsvarsmakten.se/sv/aktuellt/2016/09/militarregion-syds-tipslinje/');
                                  },
                              ),

                            ],
                          ),
                        ),

                    ),
                    ElevatedButton(
                      child: Text(
                        'TILLBAKA',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF707070),
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Information');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                  ],
                ),
                height: 535.0,
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
















  /*@override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new Center(
        child: SafeArea(
          child: new Column(
            children: [

           new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text: 'Svenska Marinen På Facebook',
                  style: new TextStyle(color: Colors.green),
                ),
                new TextSpan(
                  text:
                      '\n https://www.facebook.com/svfmmarinen/posts/204813238077540\n',
                  style: new TextStyle(color: Colors.blue),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          'https://www.facebook.com/svfmmarinen/posts/204813238077540');
                    },
                ),
                new TextSpan(
                  text: '\n Försvarsmakten syds tipslinje \n',
                  style: new TextStyle(color: Colors.green),
                ),
                new TextSpan(
                  text:
                      ' https://www.forsvarsmakten.se/sv/aktuellt/2016/09/militarregion-syds-tipslinje/',
                  style: new TextStyle(color: Colors.blue),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          'https://www.forsvarsmakten.se/sv/aktuellt/2016/09/militarregion-syds-tipslinje/');
                    },
                ),

              ],
            ),
          ),
              TextButton(
                child: Text('Tillbaka'),
                onPressed: () {
                  Navigator.pushNamed(context, '/Information');
                },
              ),
          ],
          ),
        ),
      ),
    );
  }*/

