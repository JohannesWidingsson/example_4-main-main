import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:share/share.dart';

//användaruppgifter ledd från bilagor med knapp till 'TACK'
//SKA BARA VISAS FÖRSTA GÅNGEN MAN ÖPPNAR APPEN
//textfält där man ska skriva in namn, efternamn och telefonnr

class ThankYou extends StatelessWidget {
  final String _content =
      'https://www.forsvarsmakten.se/sv/aktuellt//09/militarregion-syds-tipslinje/';
  void _shareContent() {
    Share.share(_content);
  }

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
                      padding: const EdgeInsets.fromLTRB(50, 50, 40, 0),
                      child: FittedBox(
                        child: RichText(
                          text: TextSpan(


                            children: [
                              new TextSpan(
                                text: 'TACK!\n\n',
                                style: TextStyle(
                                  fontFamily: 'gunplay',
                                  fontSize: 80,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              new TextSpan(
                                text: 'Din insats hjälper oss att stärka\nSveriges försvar.\nDen rapporterade händelsen kommer\natt vidarebefodras till försvarsmakten\nför att rätt personer ska kunna ta del\nav den.\n ',
                                style: new TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Roboto'),
                              ),

                              new TextSpan(
                                  text: '\nHåll ögonen öppna och rapportera\nom du ser något avvikande. Tipsa\ngärna dem du känner om appen så\natt vi blir fler som kan hålla ögonen\nöppna.\n',
                                style: new TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Roboto'),
                              ),


                            ],
                          ),
                        ),
                      ),

                    ),
                   Container(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.fromLTRB(60,0,0,0),
                      child: ElevatedButton(
                        child: Text(
                          'DELA APPEN',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xFF707070),
                            fontSize: 14,
                          ),
                        ),
                        onPressed: _shareContent,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,60,0),
                      child: ElevatedButton(
                        child: Text(
                          'STARTSIDA',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xFF707070),
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Rapportera');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ),
                    ),
      ],
                    ),
                   ),


                   /* TextButton(
                      onPressed: _shareContent,
                      child: Text('DELA APPEN'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Rapportera');
                      },
                      child: Text('Startsida'),
                    ),*/
                  ],
                ),
                height: 530.0,
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
