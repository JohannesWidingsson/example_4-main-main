/*
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Location extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatFormMap(
        initialCameraPosition: CameraPosition(
          target: const LatLng(47.6, 8.8796),
          zoom: 16.0,
        ),
        markers: Set<Marker>.of(
          [
            Marker(
              markerId: MarkerId('marker_1'),
              position: LatLng(47.6, 8.8796),
              consumeTapEvents: true,
              infoWindow: InfoWindow(
                title: 'PlatformMarker',
                snippet: "Hi I'm a Platform Marker",
              ),
              onTap: () {
                print("Marker tapped");
              },
            ),
          ],
        ),
        mapType: MapType.satellite,
        onTap: (location) => print('onTap: $location'),
        onCameraMove: (cameraUpdate) => print('onCameraMove: $cameraUpdate'),
        compassEnabled: true,
        onMapCreated: (controller) {
          Future.delayed(Duration(seconds: 2)).then(
            (_) {
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(
                    bearing: 270.0,
                    target: LatLng(51.5160895, -0.1294527),
                    tilt: 30.0,
                    zoom: 18,
                  ),
                ),
              );
              controller
                  .getVisibleRegion()
                  .then((bounds) => print("bounds: ${bounds.toString()}"));
            },
          );
        },
      ),
    );
  }
}

*/

/*
import 'dart:async';

import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/// Defines the main theme color.
final MaterialColor themeMaterialColor =
BaseflowPluginExample.createMaterialColor(
    const Color.fromRGBO(48, 49, 60, 1));

void main() {
  runApp(BaseflowPluginExample(
    pluginName: 'Geolocator',
    githubURL: 'https://github.com/Baseflow/flutter-geolocator',
    pubDevURL: 'https://pub.dev/packages/geolocator',
    pages: [GeolocatorWidget.createPage()],
  ));
}

/// Example [Widget] showing the functionalities of the geolocator plugin
class GeolocatorWidget extends StatefulWidget {
  /// Utility method to create a page with the Baseflow templating.
  static ExamplePage createPage() {
    return ExamplePage(Icons.location_on, (context) => GeolocatorWidget());
  }

  @override
  _GeolocatorWidgetState createState() => _GeolocatorWidgetState();
}

class _GeolocatorWidgetState extends State<GeolocatorWidget> {
  final List<_PositionItem> _positionItems = <_PositionItem>[];
  StreamSubscription<Position>? _positionStreamSubscription;
  StreamSubscription<ServiceStatus>? _locationServiceStatusSubscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        itemCount: _positionItems.length,
        itemBuilder: (context, index) {
          final positionItem = _positionItems[index];

          if (positionItem.type == _PositionItemType.permission) {
            return ListTile(
              title: Text(positionItem.displayValue,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            );
          } else {
            return Card(
              child: ListTile(
                tileColor: themeMaterialColor,
                title: Text(
                  positionItem.displayValue,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: FloatingActionButton.extended(
              onPressed: () => setState(_positionItems.clear),
              label: Text("clear"),
            ),
          ),
          Positioned(
            bottom: 80.0,
            right: 10.0,
            child: FloatingActionButton.extended(
              onPressed: () async {
                await Geolocator.getLastKnownPosition().then((value) => {
                  _positionItems.add(_PositionItem(
                      _PositionItemType.position, value.toString()))
                });

                setState(
                      () {},
                );
              },
              label: Text("Last Position"),
            ),
          ),
          Positioned(
            bottom: 150.0,
            right: 10.0,
            child: FloatingActionButton.extended(
                onPressed: () async {
                  await Geolocator.getCurrentPosition().then((value) => {
                    _positionItems.add(_PositionItem(
                        _PositionItemType.position, value.toString()))
                  });

                  setState(
                        () {},
                  );
                },
                label: Text("Current Position")),
          ),
          Positioned(
            bottom: 220.0,
            right: 10.0,
            child: FloatingActionButton.extended(
              onPressed: _toggleListening,
              label: Text(() {
                if (_positionStreamSubscription == null) {
                  return "Start position updates stream";
                } else {
                  final buttonText = _positionStreamSubscription!.isPaused
                      ? "Resume"
                      : "Pause";

                  return "$buttonText position updates stream";
                }
              }()),
              backgroundColor: _determineButtonColor(),
            ),
          ),
          Positioned(
              bottom: 430.0,
              right: 10.0,
              child: FloatingActionButton.extended(
                onPressed: _toggleLocationServiceListener,
                label: Text(() {
                  if (_locationServiceStatusSubscription == null) {
                    return "Start location service stream";
                  } else {
                    final buttonText =
                    _locationServiceStatusSubscription!.isPaused
                        ? "Resume"
                        : "Pause";
                    return "$buttonText location service stream";
                  }
                }()),
                backgroundColor: _determineLocationServiceButtonColor(),
              )),
          Positioned(
            bottom: 290.0,
            right: 10.0,
            child: FloatingActionButton.extended(
              onPressed: () async {
                await Geolocator.checkPermission().then((value) => {
                  _positionItems.add(_PositionItem(
                      _PositionItemType.permission, value.toString()))
                });
                setState(() {});
              },
              label: Text("Check Permission"),
            ),
          ),
          Positioned(
            bottom: 360.0,
            right: 10.0,
            child: FloatingActionButton.extended(
              onPressed: () async {
                await Geolocator.requestPermission().then((value) => {
                  _positionItems.add(_PositionItem(
                      _PositionItemType.permission, value.toString()))
                });
                setState(() {});
              },
              label: Text("Request Permission"),
            ),
          ),
        ],
      ),
    );
  }

  bool _isListening() => !(_positionStreamSubscription == null ||
      _positionStreamSubscription!.isPaused);

  bool _isLocationServiceListening() =>
      !(_locationServiceStatusSubscription == null ||
          _locationServiceStatusSubscription!.isPaused);

  Color _determineButtonColor() {
    return _isListening() ? Colors.green : Colors.red;
  }

  Color _determineLocationServiceButtonColor() {
    return _isLocationServiceListening() ? Colors.green : Colors.red;
  }

  void _toggleLocationServiceListener() {
    if (_locationServiceStatusSubscription == null) {
      final serviceStatusStream = Geolocator.getServiceStatusStream();
      _locationServiceStatusSubscription = serviceStatusStream
          .handleError((error) {
        _locationServiceStatusSubscription?.cancel();
        _locationServiceStatusSubscription = null;
      }).listen((status) => setState(() => _positionItems.add(_PositionItem(
          _PositionItemType.locationServiceStatus, status.toString()))));
      _locationServiceStatusSubscription?.pause();
    }

    setState(() {
      if (_locationServiceStatusSubscription == null) {
        return;
      }
      if (_locationServiceStatusSubscription!.isPaused) {
        _locationServiceStatusSubscription!.resume();
      } else {
        _locationServiceStatusSubscription!.pause();
      }
    });
  }

  void _toggleListening() {
    if (_positionStreamSubscription == null) {
      final positionStream = Geolocator.getPositionStream();
      _positionStreamSubscription = positionStream.handleError((error) {
        _positionStreamSubscription?.cancel();
        _positionStreamSubscription = null;
      }).listen((position) => setState(() => _positionItems.add(
          _PositionItem(_PositionItemType.position, position.toString()))));
      _positionStreamSubscription?.pause();
    }

    setState(() {
      if (_positionStreamSubscription == null) {
        return;
      }

      if (_positionStreamSubscription!.isPaused) {
        _positionStreamSubscription!.resume();
      } else {
        _positionStreamSubscription!.pause();
      }
    });
  }

  @override
  void dispose() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription!.cancel();
      _positionStreamSubscription = null;
    }

    super.dispose();
  }
}

enum _PositionItemType {
  permission,
  position,
  locationServiceStatus,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue);

  final _PositionItemType type;
  final String displayValue;
}

 */

