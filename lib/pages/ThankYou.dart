import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:share/share.dart';

//användaruppgifter ledd från bilagor med knapp till 'TACK'
//SKA BARA VISAS FÖRSTA GÅNGEN MAN ÖPPNAR APPEN
//textfält där man ska skriva in namn, efternamn och telefonnr

class ThankYou extends StatelessWidget {
  final String _content = 'https://www.forsvarsmakten.se/sv/aktuellt//09/militarregion-syds-tipslinje/';
  void _shareContent() {
    Share.share(_content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            children: <Widget>[

              Column(
                children: [
                  Text('Tack!'),
                ],
              ),

              TextButton(
                onPressed: _shareContent,
                child: Text('DELA APPEN'),
              ),






              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Rapportera');
                },
                child: Text('Startsida'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
