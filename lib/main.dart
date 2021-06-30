import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:example_4/pages/Attachments_Choose.dart';
import 'package:example_4/pages/Attachments_Confirm.dart';
import 'package:example_4/pages/CameraAndGalleryTest.dart';
import 'package:example_4/pages/DateTime.dart';
import 'package:example_4/pages/Email.dart';
import 'package:example_4/pages/Event.dart';
import 'package:example_4/pages/ExternLinks.dart';
import 'package:example_4/pages/Information.dart';
import 'package:example_4/pages/Information_2.dart';
//import 'package:example_4/pages/Johannes.dart';
import 'package:example_4/pages/Plats.dart';
import 'package:example_4/pages/Rapportera.dart';
import 'package:example_4/pages/Location.dart';
import 'package:example_4/pages/Test5.dart';
import 'package:example_4/pages/UserInfo.dart';
import 'package:example_4/pages/Test2.dart';
import 'package:example_4/pages/ThankYou.dart';
import 'package:flutter/material.dart';
import 'package:example_4/pages/Location.dart';
import 'package:example_4/pages/HomePage.dart';
import 'package:example_4/pages/Camera.dart';
import 'package:example_4/pages/Attachments.dart';
import 'package:example_4/pages/Location_Key.dart';


Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;



  runApp(
    MaterialApp(
      initialRoute: '/Rapportera',
      routes: {
        //'/Test5': (context) => LocationScreen(),
        //'/Johannes': (context) => Johannes(),
        '/Location': (context) => LocationScreen(),
        '/Location_Key': (context) => Location_Key(),
        '/Test': (context) => AttachmentsTest(),
        '/Camera': (context) => TakePictureScreen(camera: firstCamera),
        //'/Email': (context) => EmailSender(),
        '/Attachments': (context) => Attachments(),
        '/DateTime': (context) => MyHomePage(),
        '/ExternLinks': (context) => ExternLinks(),
        '/Event': (context) => Event(),
        '/Rapportera': (context) => Rapportera(),
        '/Information': (context) => Information(),
        '/Information_2': (context) => Information_2(),
        '/UserInfo': (context) => UserInfo(),
        '/Plats': (context) => Plats(),
        '/Attachments_Choose': (context) => Attachments_Choose(),
        '/Attachments_Confirm': (context) => Attachments_Confirm(),
        '/ThankYou': (context) => ThankYou(),
      },
    ),
  );
}
