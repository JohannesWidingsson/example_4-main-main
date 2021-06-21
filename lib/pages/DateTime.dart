import 'dart:async';

import 'package:example_4/pages/Event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// For changing the language
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';

const appName = 'Rapportera';
/*s
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyHomePage();

    (
      title: appName,
      home: MyHomePage(),
      theme: ThemeData.light().copyWith(
          inputDecorationTheme:
              InputDecorationTheme(border: OutlineInputBorder())),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Spanish
        const Locale('fr'), // French
        const Locale('zh'), // Chinese
        const Locale('sv'), // Swedish
      ],
    );
  }
}
*/
class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(appName)),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: DateTimeForm())),
        ));
  }
}

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 24),
          BasicDateField(),
          SizedBox(height: 24),
          BasicTimeField(),
          SizedBox(height: 24),
          SizedBox(height: 24),
          SizedBox(height: 24),
          SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              child: Text('Nästa'),
              onPressed: () {
                Navigator.pushNamed(context, '/Event');
              },

              ),
          ),

        ],
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  static TextEditingController datee = TextEditingController();
  static final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Välj Datum (${format.pattern})'),
      DateTimeField(
        controller: datee,
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(

              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class BasicTimeField extends StatelessWidget {
  static TextEditingController timee = TextEditingController();
  static final format = DateFormat('HH:mm');

  @override

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Välj Tid (${format.pattern})'),


      DateTimeField(
        controller: timee,
        format: format,
        onShowPicker: (context, currentValue) async {

          final  TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return time == null ? null : DateTimeField.convert(time);
        },
      ),
    ]);
  }
}
