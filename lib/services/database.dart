import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hobbyhub/modules/Tutor.dart';
import 'package:hobbyhub/modules/need.dart';

class DatabaseService {
//  final String uid;
  final String category;

  DatabaseService({this.category});
//  List<String> list = ['dance'];

  CollectionReference needCollection;
  Future addHelp(
      String name, String contact,String type, String address, String description,double latitude,double longitude,String uid) async {
    needCollection = FirebaseFirestore.instance.collection(category);
    return await needCollection.doc().set({
      'name': name,
      'contact': contact,
      'address': address,
      'type' : type,
      'description': description,
      'latitude' : latitude,
      'longitude' : longitude,
        'uid' :uid,
    });
  }

  List<Need> needListFromSnapshot(QuerySnapshot snapshot) {
    needCollection= FirebaseFirestore.instance.collection(category);
    return snapshot.docs.map((doc) {
      return Need(
        name: doc.data()['name'] ?? '',
        type: doc.data()['type'] ?? 'N/A',
        description: doc.data()['description'] ?? 'N/A',
        latitude: doc.data()['latitude'] ?? 0.0,
        longitude: doc.data()['longitude'] ?? 0.0,
        address: doc.data()['address'] ?? 'N/A',
        uid : doc.data()['uid'] ?? 'N/A',
        contact : doc.data()['contact'] ?? 'N/A'
      );
    }).toList();
  }

  Stream<List<Need>> get data {
    needCollection = FirebaseFirestore.instance.collection(category);
    return FirebaseFirestore.instance
        .collection(category)
        .snapshots()
        .map(needListFromSnapshot);
  }
}
