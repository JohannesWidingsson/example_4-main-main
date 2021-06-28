import 'package:flutter/material.dart';

class Information_2 extends StatelessWidget {
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
                      padding: const EdgeInsets.fromLTRB(40, 60, 40, 30),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Vilken information är det då som försvaret gärna vill ha?\n\n'
                              'Allt som avviker från \nvardagsmönstret på land eller till \nsjöss, som riktar sig mot\nförsvarsmaktens objekt eller \nverksamhet i regionen (Skåne, \nBlekinge, Kronobergs, Kalmar, Jönköpings och i Östergötlands län)\n\n'
                              'När du registrerar något via denna \napp kommer det att genereras ett \nmail genom ditt mailprogram och \nsom skickas direkt till \nförsvarsmakten. Ingen information sparas.',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Roboto'),
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
                        Navigator.pushNamed(context, '/Test3');
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
