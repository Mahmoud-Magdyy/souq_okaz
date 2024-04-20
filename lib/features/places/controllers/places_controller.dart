import 'package:get/get.dart';
import 'package:okaz_souq/features/restaurants/pages/restaurants_page.dart';
import 'package:okaz_souq/features/shops/pages/shops_page.dart';
import 'package:okaz_souq/features/theaters/pages/theaters_page.dart';

class PlacesController extends GetxController {
  var selectedWidgetIndex = 0.obs;
  final homeWidgets = [];
  @override
  void onInit() {
    homeWidgets.addAll([
       RestaurantsPage(),
      const TheatersPage(),
      const ShopsPage(),
    ]);
    super.onInit();
  }
}