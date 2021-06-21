/*import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
        child: Column(
            children: <Widget> [
              Image.network('https://images.hdqwalls.com/wallpapers/minimal-sunset-landscape-4k-w5.jpg'),
              Text('Välkommen till Mink137, appen där du som privatperson kan rapportera om du har sett något ovanligt i mark eller längst våra kuster.'
                  ' Appens syfte är att hjälpa försvarsmakten och marinen att samla information om misstänkt aktivitet'
                  'Vi som står bakom appen är Activout AB i Ronneby, inte det svenska försvaret. '
                  'Om du istället vill komma i direkt kontakt med försvarsmakten finns vidare information "HÄR".'),

              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/Information_2');
              },
                child: Text('Fortsätt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: SafeArea(
          child: new Column(
            children: [

             RichText(
              text: TextSpan(
                text: 'Välkommen till Mink137, appen där du som privatperson kan rapportera om du har sett något ovanligt i mark eller längst våra kuster.'
                    ' Appens syfte är att hjälpa försvarsmakten och marinen att samla information om misstänkt aktivitet'
                    'Vi som står bakom appen är Activout AB i Ronneby, inte det svenska försvaret. '
                    'Om du istället vill komma i direkt kontakt med försvarsmakten finns vidare information .',
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '"HÄR" ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/ExternLinks');
                        },
                      style: TextStyle(
                        color: Colors.blue,
                      )),

                 // TextSpan(text: 'text!'),
                ],
              ),
            ),
              TextButton(
                child: Text('Fortsätt'),
                onPressed: () {
                  Navigator.pushNamed(context, '/Information_2');
                },
              ),
            ],
          ),
        ),
        ),
    );


  }
}
