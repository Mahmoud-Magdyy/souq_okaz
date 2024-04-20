import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:okaz_souq/core/shared/styles/my_colors.dart';
import 'package:okaz_souq/core/shared/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/restaurants_controller.dart';

class RestaurantsPage extends GetView<RestaurantsController> {
  const RestaurantsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantsController());
    controller.getData();
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(color: MyColors.primaryColor,),
          )
        : AnimationLimiter(
            child: ListView.builder(
              itemCount: controller.restaurantList.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 400),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: ScaleAnimation(
                      child: Card(
                        child: SizedBox(
                          height: 200,
                          child: Row(
                            children: [
                              Image.network(
                                controller.restaurantList[index].image,
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 200,
                                fit: BoxFit.fitHeight,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.restaurantList[index].title,
                                        style: MyTextStyles.hTwoTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              fixedSize:
                                                  const MaterialStatePropertyAll(
                                                      Size(130, 50)),
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                      Colors.white),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.0),
                                                      side: const BorderSide(
                                                          color: Colors.lightBlueAccent)))),
                                          onPressed: () {
                                            final Uri url = Uri.parse(controller
                                                .restaurantList[index]
                                                .location);
                                            launchUrl(url);
                                          },
                                          child: const Text("Google Map")),
                                      ElevatedButton(
                                        clipBehavior: Clip.hardEdge,
                                        style: ButtonStyle(
                                            fixedSize:
                                                const MaterialStatePropertyAll(
                                                    Size(130, 50)),
                                            backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    MyColors.primaryColor),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.0),
                                                    side: const BorderSide(
                                                        color: Colors.red)))),
                                        onPressed: () {
                                          final Uri url = Uri.parse(controller
                                              .restaurantList[index].website);
                                          launchUrl(url);
                                        },
                                        child: const Text(
                                          "Website",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              //
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ));
  }
}
