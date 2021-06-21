/*import 'dart:async';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:example_4/pages/DateTime.dart';
import 'package:example_4/pages/Event.dart';
import 'package:example_4/pages/UserInfo2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EmailSender extends StatefulWidget {
  const EmailSender({Key? key}) : super(key: key);

  @override
  _EmailSenderState createState() => _EmailSenderState();
}

class _EmailSenderState extends State<EmailSender> {
  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'saleh_daabas@hotmail.com',
  );

  final _subjectController = TextEditingController(text: 'Avvikande Aktivitet');

  TextEditingController textController = MyCustomFormState.textController;
  TextEditingController date = BasicDateField.datee;
  TextEditingController timee = BasicTimeField.timee;
  TextEditingController firstName = UserInfo.firstName;
  TextEditingController lastName = UserInfo.lastName;
  TextEditingController phoneNumber = UserInfo.phoneNumber;


  Future<void> send() async {

    final Email email = Email(
      body: "Tid: " + timee.text + "\n " + "Datum: " +  date.text + "\n" + "Händelse: \n" + textController.text + "\n" +
      "Från: " + firstName.text + " " + lastName.text + "\n" + "Telefonnummer: " + phoneNumber.text ,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
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
      appBar: AppBar(
        title: Text('Rapportera'),
        backgroundColor: Color(555849),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          IconButton(
            onPressed: send,
            icon: Icon(Icons.send),
          ),
          //PopupMenuButton(itemBuilder: itemBuilder)
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _recipientController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mottagare',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),

              child: TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ämne',
                ),
              ),

            ),


        Expanded(

              child: Padding(

                padding: EdgeInsets.all(8.0),


                child:  TextField(
                  controller: timee,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  //decoration: InputDecoration(border: OutlineInputBorder()),
                ),

              ),


            ),

            Expanded(

              child: Padding(

                padding: EdgeInsets.all(8.0),


                child:  TextField(
                  controller: date,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  //decoration: InputDecoration(border: OutlineInputBorder()),
                ),

              ),


            ),




            /*CheckboxListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              title: Text('HTML'),
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() {
                    isHTML = value;
                  });
                }
              },
              value: isHTML,
            ),*/

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  for (var i = 0; i < attachments.length; i++)
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            attachments[i],
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () => {_removeAttachment(i)},
                        )
                      ],
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.attach_file),
                      onPressed: _openImagePicker,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }

  void _openImagePicker() async {
    final picker = ImagePicker();

    PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }
}*/
