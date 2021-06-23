import 'dart:async';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:example_4/pages/Attachments_Choose.dart';
import 'package:example_4/pages/DateTime.dart';
import 'package:example_4/pages/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'saleh_daabas@hotmail.com',
  );

  final _subjectController = TextEditingController(text: 'Avvikande Aktivitet');
  final _formKey = GlobalKey<FormState>();
  TextEditingController textController = MyCustomFormState.textController;
  TextEditingController date = BasicDateField.datee;
  TextEditingController timee = BasicTimeField.timee;

  static TextEditingController firstName = TextEditingController();
  static TextEditingController lastName = TextEditingController();
  static TextEditingController phoneNumber = TextEditingController();

  List<String> attachmentss =
      Attachments_ChooseState.attachments.cast<String>();

  Future<void> send() async {
    final Email email = Email(
      body: "Tid: " +
          timee.text +
          "\n " +
          "Datum: " +
          date.text +
          "\n" +
          "Händelse: \n" +
          textController.text +
          "\n" +
          "Från: " +
          firstName.text +
          " " +
          lastName.text +
          "\n" +
          "Telefonnummer: " +
          phoneNumber.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachmentss,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //List <TextEditingController> test =  [timee, date];

    return Scaffold(
      backgroundColor: Color(0xFFF5F4E2),
      body: Form(
        key: _formKey,
        child: Center(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 540.0,
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
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 30, 30, 0),
                        child: Row(
                          children: [
                            Text(
                              'ANVÄNDARUPPGIFTER',
                              style: TextStyle(
                                fontFamily: 'gunplay',
                                fontSize: 24,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.help_outline, color: Colors.white )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Container(
                          height: 250.0,
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF707070).withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 15, 8, 10),
                                child: Container(
                                  color: Color(0xFFFFFFFF),
                                  height: 50,
                                  child: TextFormField(
                                    controller: firstName,
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 0.5),
                                      ),
                                      hintText: 'Förnamn*',
                                    ),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Detta fält är obligatoriskt!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 15),
                                child: Container(
                                  color: Color(0xFFFFFFFF),
                                  height: 50,
                                  child: TextFormField(
                                    controller: lastName,
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 0.5),
                                      ),
                                      hintText: 'Efternamn*',
                                    ),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "Detta fält är obligatoriskt!";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Container(
                                  color: Color(0xFFFFFFFF),
                                  height: 50,
                                  child: TextField(
                                    controller: phoneNumber,
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 0.5),
                                      ),
                                      hintText: 'Telefonnummer',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 70, 0),
                                child: Text(
                                  'Ange ditt telefonnummer inklusive riktnummer',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF707070),
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Användaruppgifter behöver du bara registrera\n'
                          'första gången du rapporterar en händelse. \n nästa gång finns dessa sparade i appen.',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Color(0xFFFFFFFF),
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
                          if (_formKey.currentState!.validate()) {
                            send();
                            Navigator.pushNamed(context, '/ThankYou');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
      ),
    );
  }
}
