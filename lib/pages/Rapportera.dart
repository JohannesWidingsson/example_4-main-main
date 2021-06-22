import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rapportera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4E2),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[

              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // padding: const EdgeInsets.fromLTRB(0,0,180,0),

                        // För Image
                        Image.asset(
                          'lib/assets/mink3.png',
                          width: 200.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),

                        // Mink137 stylen.
                        Text(
                          'MINK137',
                          style: TextStyle(
                            fontFamily: 'gunplay',
                            fontSize: 92,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                height: 400.0,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 49, 0, 40),
                child: Text(
                  'Har du sett något?\nHör av dig till oss!',
                  style: TextStyle(
                    fontFamily: 'gunplay',
                    fontSize: 32,
                    color: Color(0xFF555849),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ElevatedButton(
                  child: Text(
                    'RAPPORTERA',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xFF707070),
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Information');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              )
              //GoogleFonts.getFont('Roboto'),
            ],
          ),
        ),
      ),
    );
  }
}
