
import 'package:example_4/pages/Attachments.dart';



import 'package:example_4/pages/ThankYou.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class Attachments_Confirm extends StatefulWidget {
  const Attachments_Confirm({Key? key}) : super(key: key);

  @override
  _Attachments_ConfirmState createState() => _Attachments_ConfirmState();
}

class _Attachments_ConfirmState extends State<Attachments_Confirm> {

  AttachmentsState attachmentstate = AttachmentsState();

  static List<String> attachments = [];

/*
  void openImagePicker() async {
    final picker = ImagePicker();

    PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);

      });
    }
  }*/


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

          //PopupMenuButton(itemBuilder: itemBuilder)
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Wrap(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 16, 35, 16),
                          child: Text(
                            'BILAGOR',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'gunplay',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(35, 16, 35, 16),
                            child: Text(
                              'Har du tagit bilder eller video\npå det inträffade?',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                          child: Container(
                            height: 200.0,
                            width: 330,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF707070).withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(16, 30, 16, 40),
                                    child: Text(
                                      'Bifoga video eller bild till ditt meddelande\n eller tryck Klar för att hoppa över detta steg.\n' + '\nBifogad fil: ' +  AttachmentsState.basename,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF707070),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: ElevatedButton(
                                          onPressed: (){
                                            attachmentstate.openImagePicker();
                                            Navigator.pushNamed(context, '/Attachments_Confirm');
                                          },


                                          child: Text(
                                            'VÄLJ FIL',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF707070),
                                              fontSize: 14,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/UserInfo');
                                          },
                                          child: Text(
                                            'KLAR',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF707070),
                                              fontSize: 14,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
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
            ],
          ),
        ),
      ),
    );
  }


}










