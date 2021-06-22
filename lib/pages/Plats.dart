import 'package:flutter/material.dart';

class Plats extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapportera'),
        backgroundColor: Color(555849),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),

          //PopupMenuButton(itemBuilder: itemBuilder)
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),


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
