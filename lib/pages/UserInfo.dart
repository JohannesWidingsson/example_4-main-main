import 'dart:async';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:example_4/pages/Attachments_Choose.dart';
import 'package:example_4/pages/DateTime.dart';
import 'package:example_4/pages/Event.dart';
import 'package:example_4/pages/UserInfo2.dart';
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

  List<String> attachmentss = Attachments_ChooseState.attachments.cast<String>();



  Future<void> send() async {

    final Email email = Email(
      body: "Tid: " + timee.text + "\n " + "Datum: " +  date.text + "\n" + "Händelse: \n" + textController.text + "\n" +
          "Från: " + firstName.text + " " + lastName.text + "\n" + "Telefonnummer: " + phoneNumber.text,
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
                    send();
                    Navigator.pushNamed(context, '/ThankYou');
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


}