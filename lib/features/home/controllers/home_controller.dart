import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okaz_souq/features/map/pages/map_page.dart';
import 'package:okaz_souq/features/overview/pages/overview_page.dart';
import 'package:okaz_souq/features/places/pages/places_page.dart';
import '../../../core/shared/models/user_model.dart';
import '../../../core/shared/styles/my_colors.dart';

class HomeController extends GetxController {
  var selectedWidgetIndex = 0.obs;
  final UserModel userModel;
  final homeWidgets = [];
  HomeController ({required this.userModel});
  @override
  void onInit() {
    homeWidgets.addAll([
       OverviewPage(),
      const PlacesPage(),
      const MapPage(),]);
    super.onInit();
  }
  @override
  void onReady (){
    super.onReady();
  }

  List<BottomNavigationBarItem> getItems (){
    return const[
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: MyColors.primaryColor),
      BottomNavigationBarItem(icon: Icon(Icons.place),label: "Locations"),
      BottomNavigationBarItem(icon:Icon(Icons.map),label: "Map" )
    ];
  }

}