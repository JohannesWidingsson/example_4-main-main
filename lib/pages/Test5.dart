/*
// @dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class LocationScreen extends StatefulWidget {
  @override
  LocationChooserState createState() => LocationChooserState();
}

class LocationChooserState extends State<LocationScreen> {
  //Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.343434, -122.545454);
  //LatLng initialcameraposition = LatLng(slocation.getLocation());
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  static String _title = "";
  static String _detail = "";
  static TextEditingController lane1;
 GoogleMapController _controller;
 Location slocation = Location();

  @override
  void initState() {
    super.initState();
   lane1 = new TextEditingController();
  }

  Future <void> _onMapCreated(GoogleMapController _cntlr)
  async {
    _controller = _cntlr;
    slocation.getLocation();

  }


  @override
  Widget build(BuildContext context) {
    double _height  = MediaQuery
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
          children: [
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

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [

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
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //void _onMapCreated(GoogleMapController controller) {
    //_controller.complete(controller);
  //}

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _handleTap(LatLng point) {
    _markers.clear();
    _getLocation(point);
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(title: _title, snippet: _detail),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
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

}

*/

