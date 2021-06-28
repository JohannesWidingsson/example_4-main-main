import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F4E2),
        appBar: AppBar(
          title: Text('Rapportera'),
          backgroundColor: Color(0xFF555849),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),


          ],
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ),
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
      child: Center(
        child: SafeArea(
          child: new Column(
            children: <Widget>[

              Container(
                height: 490.0,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text(
                            'DATUM OCH TID',
                            style: TextStyle(
                              fontFamily: 'gunplay',
                              fontSize: 24,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text(
                            'När inträffade det som du vill rapportera?',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        //SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
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
                                BasicDateField(),
                                BasicTimeField(),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 20, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          child: Text(
                                            'Nästa',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF707070),
                                              fontSize: 14,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/Event');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //],// Container space
              //),

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
    );
  }
}

class BasicDateField extends StatelessWidget {
  static TextEditingController datee = TextEditingController();
  static final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      Padding(
        padding: const EdgeInsets.fromLTRB(10,12,10,5),
        child: DateTimeField(

          decoration: const InputDecoration(

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
            ),
            hintText: 'Datum',

          ),

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
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0,0,85,0),
        child: Text(
          'Ange datum i formatet (${format.pattern})',

          style: TextStyle(
            color: Color(0xFF707070),
            fontSize: 11,
          ),
        ),
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
      Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,5),
        child: DateTimeField(
    decoration: const InputDecoration(

    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 0.5),
    ),
        hintText: 'Tid',),
          controller: timee,
          format: format,
          onShowPicker: (context, currentValue) async {
            final TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return time == null ? null : DateTimeField.convert(time);
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0,0,120,0),
        child: Text(
          'Ange tiden i formatet (${format.pattern})',
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF707070),
          ),
        ),
      )
    ]);
  }
}
