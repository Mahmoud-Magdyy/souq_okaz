import 'package:flutter/material.dart';
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
    return Obx(() => controller.isLoading.value ?
    const Center( child:  CircularProgressIndicator(),)
        :
        ListView.builder (
          itemCount: controller.restaurantList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: SizedBox(
                height: 200,
                child: Row (
                  children: [
                    Image.network(controller.restaurantList[index].image,
                     width: MediaQuery.of(context).size.width*0.6 ,
                       height: 200,
                       fit: BoxFit.fitHeight,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:12.0),
                        child: Column (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.restaurantList[index].title,style: MyTextStyles.hTwoTextStyle,
                            textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                                style:  ButtonStyle(
                                    fixedSize: MaterialStatePropertyAll(Size(130,50)),
                                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9.0),
                                            side: BorderSide(color: Colors.lightBlueAccent)
                                        )
                                    )

                                ),
                                onPressed: (){
                              final Uri _url = Uri.parse(controller.restaurantList[index].location);
                              launchUrl(_url);

                            }, child: Text("Google Map")),
                            ElevatedButton(
                              clipBehavior: Clip.hardEdge,
                                style:  ButtonStyle(
                                  fixedSize: MaterialStatePropertyAll(Size(130,50)),
                                  backgroundColor: MaterialStatePropertyAll(MyColors.primaryColor),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9.0),
                                            side: BorderSide(color: Colors.red)
                                        )
                                    )

                                ),
                                onPressed: (){
                              final Uri _url = Uri.parse(controller.restaurantList[index].website);
                              launchUrl(_url);

                            }, child: Text("Website",style: TextStyle(color: Colors.black),))
                          ],
                        ),
                      ),
                    )
                    //

                  ],
                ),
              ),
            );
          },
        )
    );
  }
}
