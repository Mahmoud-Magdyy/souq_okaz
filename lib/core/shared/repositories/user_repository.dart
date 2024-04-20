import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:okaz_souq/core/shared/models/location_model.dart';

import '../models/user_model.dart';

class UserRepository {
 Future<UserModel> getUserByEmail (String email) async {
   var data =await FirebaseFirestore.instance.collection("users").where("email",isEqualTo: email).get();
   Map<String, dynamic> map = {"id": data.docs.first.id};
   map.addAll( data.docs.first.data());
  return UserModel.fromJson(map);

 }

  Future<List<LocationModel>> getRestaurants()async {
    List<LocationModel> list= [];
    var data =await FirebaseFirestore.instance.collection("restaurants").get();
    for (var companyMap in data.docs) {
      list.add(LocationModel.fromJson(companyMap.data()));
    }
    return list;
  }



}