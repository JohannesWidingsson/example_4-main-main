import 'package:flutter/material.dart';

class Plats extends StatelessWidget {

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
                child: Text('Fortsätt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
