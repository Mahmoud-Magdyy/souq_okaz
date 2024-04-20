import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/styles/my_colors.dart';
import '../controllers/places_controller.dart';

class PlacesPage extends GetView<PlacesController> {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PlacesController());
    return DefaultTabController(
      length: 3,
      initialIndex:controller.selectedWidgetIndex.value ,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Places"),
            bottom:  TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: MyColors.primaryColor,
              labelColor:MyColors.primaryColor ,
              onTap: (index){
                controller.selectedWidgetIndex.value = index;
              },
              tabs: const [
                Tab(icon: Icon(Icons.coffee),text: "Restaurants",),
                Tab(icon: Icon(Icons.theater_comedy_outlined),text: "Theaters",),
                Tab(icon: Icon(Icons.shopping_cart_outlined),text: "Shops",),
              ],
            ),
          ),
        body: Stack(
          children: [
            Container(
              decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/wallpaper.jpg"), fit: BoxFit.cover,),
              ),
            ),
            Obx(()=>controller.homeWidgets[controller.selectedWidgetIndex.value]),
          ],
        ),
      ),
    );
  }
}
