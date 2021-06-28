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
      backgroundColor: Color(0xFFF5F4E2),
      body: Center(
        child: SafeArea(
          child: new Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 60, 40, 30),

                        child: RichText(
                          text: TextSpan(
                            text:
                                'Välkommen till Mink137, appen där du som privatperson kan rapportera om du har sett något ovanligt i mark eller längst våra kuster.\n\n'
                                'Appens syfte är att hjälpa försvarsmakten och marinen att\nsamla information om misstänkt aktivitet.\n\n'
                                'Vi som står bakom appen är Activout AB i Ronneby, inte det svenska försvaret.\n\n'
                                'Om du istället vill komma i direkt kontakt med försvarsmakten finns vidare information',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Roboto'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' HÄR.',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, '/ExternLinks');
                                    },
                                  style: TextStyle(
                                    color: Colors.blue,
                                  )),

                              // TextSpan(text: 'text!'),
                            ],
                          ),
                        ),

                    ),
                    ElevatedButton(
                      child: Text(
                        'FORTSÄTT',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF707070),
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Information_2');
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
