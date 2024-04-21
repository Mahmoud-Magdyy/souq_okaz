import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okaz_souq/core/locale/app_loacl.dart';
import 'package:okaz_souq/core/utils/app_strings.dart';

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
            title:  Text(AppStrings.places.trr(context)),
            bottom:  TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: MyColors.primaryColor,
              labelColor:MyColors.primaryColor ,
              onTap: (index){
                controller.selectedWidgetIndex.value = index;
              },
              tabs:  [
                Tab(icon: const Icon(Icons.coffee),text: AppStrings.restaurants.trr(context),),
                Tab(icon: const Icon(Icons.theater_comedy_outlined),text: AppStrings.theaters.trr(context),),
                Tab(icon: const Icon(Icons.shopping_cart_outlined),text: AppStrings.shops.trr(context),),
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
