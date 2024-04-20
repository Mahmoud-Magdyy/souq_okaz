import 'package:get/get.dart';
import 'package:okaz_souq/core/shared/models/location_model.dart';
import 'package:okaz_souq/core/shared/repositories/user_repository.dart';

class RestaurantsController extends GetxController {

  var restaurantList = <LocationModel>[].obs;
  var isLoading = false.obs;

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  getData () async {
    isLoading.value = true;
   restaurantList.value = await Get.find<UserRepository>().getRestaurants ();
    isLoading.value = false;
  }

}