// @dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  @override
  LocationChooserState createState() => LocationChooserState();
}

class LocationChooserState extends State<LocationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center =
  const LatLng(55.70466010000001, 13.191007300000023);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  static String _title = "";
  static String _detail = "";
  static String _address;


  static TextEditingController lane1;

  @override
  void initState() {
    super.initState();
    lane1 = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF555849),
        title: Column(

          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Rapportera'),
                  Container(
                    child: Row(
                      children: <Widget>[
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),

      resizeToAvoidBottomInset: true,
      body:


      Stack(
        children: [


          GoogleMap(
            mapToolbarEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 8.0),
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
                          Navigator.pushNamed(context, '/LocationChoosen');
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


    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

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

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          point.latitude,
          point.longitude
      );
      Placemark place = placemarks[0];

      setState(() {
        _title = point.latitude.toString();
        _detail = point.longitude.toString();
        _address =  "${place.street}, ${place.postalCode}, ${place.locality} ${place.country},";


        lane1.text = "Lat: " +_title + "\n" + " Long: " + _detail + "\n "  +_address;

      });
    } catch (e) {
      print(e);
    }
  }

}
