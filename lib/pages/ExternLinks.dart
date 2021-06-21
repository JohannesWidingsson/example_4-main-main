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
  }
}
