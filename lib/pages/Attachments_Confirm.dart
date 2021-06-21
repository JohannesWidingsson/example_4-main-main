

//här confirmas rätt fil sen en knapp som leder till användaruppgifter


import 'package:flutter/material.dart';


class Attachments_Confirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('BILAGOR'),
              Text('Har du tagit bilder eller video på det inträffade?'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Attachments_Choose');
                },
                child: Text('VÄLJ FIL'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/UserInfo');
                },
                child: Text('KLAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}