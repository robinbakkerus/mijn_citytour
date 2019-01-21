import 'package:cloud_firestore/cloud_firestore.dart';

class Lokatie {

  int id;
  String _name;
  GeoPoint _geopoint;
  String _geohash;
  String _summary;


  Lokatie(this._name, this._geopoint, this._geohash, this._summary);

  Lokatie.map(dynamic obj) {
    this._name = obj["name"];
    this._geopoint = obj["geolocation"];
    this._geohash = obj["geohash"];
    this._summary = obj["summary"];
  }

  String get name => _name;
  GeoPoint get geopint => _geopoint;
  String get geohash => _geohash;
  String get summary => _summary;

}


