

//efter vald plats på karta ska platsen komma upp + nästa knapp

//knapp som leder till DateTime

import 'package:flutter/material.dart';

class LocationChoosen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Center(
          child: Column(
            children: <Widget> [
              Text('PLATS'),
              Text('Var hände det som du vill rapportera?\n'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/DateTime');
                },
                child: Text('NÄSTA'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Location');
                },
                child: Text('ÄNDRA'),
              ),
            ],
          )

        ),
      ),
    );


  }
}
