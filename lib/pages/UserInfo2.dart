/*import 'package:flutter/material.dart';


//användaruppgifter ledd från bilagor med knapp till 'TACK'
//SKA BARA VISAS FÖRSTA GÅNGEN MAN ÖPPNAR APPEN
//textfält där man ska skriva in namn, efternamn och telefonnr

class UserInfoo extends StatelessWidget {
  static TextEditingController firstName = TextEditingController();
  static TextEditingController lastName = TextEditingController();
  static TextEditingController phoneNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(

      body:

      Form(
        key: _formKey,
        child: Center(
        child: SafeArea(


          child: Column(
            children: <Widget>[
              Text('ANVÄNDARUPPGIFTER'),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: firstName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Förnamn*',
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Den fältet är obligatorisk !';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: SizedBox(
                  height:50,
                  child: TextFormField(
                    controller: lastName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Efternamn*',
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Den fältet är obligatorisk !";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: phoneNumber,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Telefonnummer',
                    ),
                  ),
                ),
              ),

              Text(
                'Användaruppgifter behöver du bara registrera\n'
                    'första gången du rapporterar en händelse. \n nästa gång finns dessa sparade i appen.'
              ),



              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/Email');
                  }
                },

                child: Text('Fortsätt'),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}*/
