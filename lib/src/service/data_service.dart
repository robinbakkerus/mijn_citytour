import 'fb_firestore_service.dart';
import '../model/locatie.dart';

abstract class IDataService {

  Future<List<Lokatie>> getData(String geohash) async {return null;}

  factory IDataService() {
    return FirestoreService();
  }


}