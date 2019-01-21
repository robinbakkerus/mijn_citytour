import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../service/fb_firestore_service.dart';
import 'main_appbar.dart';

class MainMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Italiaans APP',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new _MainMapPage(title: 'Citytour App'),
    );
  }
}

class _MainMapPage extends StatefulWidget {
  _MainMapPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainMapState createState() => new _MainMapState();
}

class _MainMapState extends State<_MainMapPage> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: buildMainAppBar(context, -1),
        floatingActionButton: FloatingActionButton(
          onPressed: mapController == null ? null : _movePosition,
          child: Icon(Icons.volume_off),
          heroTag: null,
        ),
        body: Container(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
            )));
  }

  void _movePosition() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      const CameraPosition(
        bearing: 270.0,
        target: LatLng(51.5160895, 5.1294527),
        tilt: 0.0,
        zoom: 12.0,
      ),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
