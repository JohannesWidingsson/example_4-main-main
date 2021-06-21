import 'package:flutter/material.dart';


class Information_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Vilken information är det då som försvaret gärna vill ha?'
                  'Allt som avviker från vardagsmönstret på land eller till sjöss, som riktar sig mot\n försvarsmaktens objekt eller verksamhet i regionen(Skåne,Blekinge,Kronobergs,Kalmar,Jönköpings och i Östergötlands län)'
                  'När du registrerar något via denna app kommer det att genereras ett mail genom ditt mailprogram som skickas direkt till försvarsmakten. Ingen information sparas.'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Plats');
                },
                child: Text('Fortsätt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}