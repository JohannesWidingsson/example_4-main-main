// @dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  @override
  LocationChooserState createState() => LocationChooserState();
}

class LocationChooserState extends State<LocationScreen> {
  // Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.343434, -122.545454);
  LatLng _centerr;
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  static String _title = "";
  static String _detail = "";
  GoogleMapController _cntroller;
  Location _location = Location();
  static TextEditingController lane1;


// TEST


  Widget buildFloatingSearchBar() {
    final isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }


  //TEST


  void _onMapCreated(GoogleMapController _cntlrl) {
    _cntroller = _cntlrl;
    _location.onLocationChanged.listen((l) {
      _cntroller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),


        ),

      );
      _centerr = LatLng(l.latitude, l.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    lane1 = new TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            //buildMap(),
            //buildBottomNavigationBar(),
            GoogleMap(

              mapToolbarEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition:
              CameraPosition(target: _center, zoom: 11.0),
              markers: _markers,
              mapType: _currentMapType,
              onCameraMove: _onCameraMove,
              onTap: _handleTap,
            ),
            buildFloatingSearchBar(),
            /*Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    _customButton(
                        FontAwesomeIcons.map, _onMapTypeButtonPressed),
                    SizedBox(
                      height: 15,
                    ),
                    _customButton(
                        FontAwesomeIcons.mapMarker, _onAddMarkerButtonPressed),
                    SizedBox(
                      height: 5,
                    ),
                    _customButton(FontAwesomeIcons.mapPin, _getUserLocation),
                  ],
                ),
              ),
            ),*/
            //Panel(
            //minHeight: _height * 0.05,
            // maxHeight: _height * 0.4,
            //panel:
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [


                  /*
                      Container(
                        height: 4,
                        width: _width * 0.2,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: _height * 0.2,
                              width: _width,
                              color: Colors.white,
                              child: TextField(
                                maxLines: 4,
                                controller: lane1,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                      borderSide:
                                      BorderSide(width: 1, color: Colors.orange),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                      borderSide:
                                      BorderSide(width: 1, color: Colors.amber),
                                    ),
                                    errorStyle: TextStyle(
                                        color: Colors.orange),
                                    labelStyle: TextStyle(
                                        color: Colors.orange),
                                    labelText: "Koordinater "),
                                cursorColor:Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),


                        child: ElevatedButton(
                          child: Text(
                            'KLAR',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFF707070),
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/DateTime');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                        ),

                        /*child: Container(
                              child: InkWell(
                                onTap: () {
                                  debugPrint("spara koordinater");
                                  Navigator.pushNamed(context, '/DateTime');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: _width * 0.3,
                                  height: 40,
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 6, bottom: 6),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF707070),
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Text(
                                    "KLAR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto'),
                                  ),
                                ),
                              ),
                            ),*/

                      ),
                    ],
                  )
                ],
              ),
            ),
            // body: null)
          ],
        ),
        //      floatingActionButton: FloatingActionButton.extended(
        //        onPressed: _goToTheLake,
        //        label: Text('To the lake!'),
        //        icon: Icon(Icons.directions_boat),
        //      ),
      ),
    );
  }

  /*void _onMapCreatedd(GoogleMapController controller) {
    _controller.complete(controller);
  }*/

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  /*_customButton(IconData icon, Function function) {
    return FloatingActionButton(
      heroTag: icon.codePoint,
      onPressed:()=> function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.white,
      child: Icon(
        icon,
        size: 16,
        color: Colors.yellow,
      ),
    );
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    _markers.clear();
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(title: _title, snippet: _detail),
          icon: BitmapDescriptor.defaultMarker));
    });
  }
  */ // kommenterade precis bort från 233 till 265. Gjorde ingen skillnad.
  _handleTap(LatLng point) {
    _markers.clear();
    _getLocation(point);
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(title: _title, snippet: _detail),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange),
      ));
    });
  }

  _getLocation(LatLng point) async {
    final coordinates = new Coordinates(point.latitude, point.longitude);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${point.latitude} : ${point.longitude}");

    setState(() {
      _title = point.latitude.toString();
      _detail = point.longitude.toString();
      lane1.text = _title + "   " + _detail;
    });
  }

/*_getUserLocation() async {
    Position position = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target:LatLng(position.latitude, position.longitude), zoom: 16),
      ),
    );

    setState(() {
      _title = first.featureName;
      _detail = first.addressLine;
      _lane1.text = _title + "   " + _detail;
    });
  }*/


}




