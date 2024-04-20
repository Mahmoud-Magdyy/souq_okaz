
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:okaz_souq/core/shared/styles/text_styles.dart';

import '../controllers/overview_controller.dart';

class OverviewPage extends GetView<OverviewController> {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OverviewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overview"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:18.0,bottom: 4),
            child: Image.asset(                        "assets/images/vision.jfif",
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration:const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/wallpaper.jpg"), fit: BoxFit.cover,),
            ),
          ),
          SafeArea (
            child: SingleChildScrollView (
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Images gallery",style: MyTextStyles.hTwoTextStyle,),
                    const SizedBox(height: 8,),
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 200.0,
                        autoPlay: true,

                      ),
                      items: [
                        // "assets/images/vision.jfif",
                        "assets/images/image1.jfif",
                        "assets/images/image2.jfif",
                        "assets/images/image3.jfif",
                        "assets/images/image5.jfif",
                        "assets/images/image6.jfif"].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Image.asset(i, fit: BoxFit.fill,),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20,),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("سوق عكاظ، هو أهم أسواق العرب وأشهرها، يقع في شمال شرقي مدينة الطائف، وهو يحمل أهمية تاريخية حيث كان العرب يجتمعون فيه للبيع والشراء، ويستمعون إلى الشعراء والخطباء، وقد سجل التاريخ لسوق عكاظ دوراً أدبياً بارزاً في الجاهلية واستمر السوق إلى عام 129هـ",

                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                      ),
                    ),
                    const Text("Poets",style: MyTextStyles.hTwoTextStyle,),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap:true,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Get.dialog(AlertDialog(
                                title: Text(controller.poetsTitle[index]),
                                content: Text(controller.poets[index],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                actions: [
                                  TextButton(onPressed: (){
                                     Clipboard.setData( ClipboardData(text: controller.poets[index]));
                                  }, child: const Text("Copy")),
                                  TextButton(onPressed: (){
                                    Get.back();
                                  }, child: const Text("Cancel"))
                                ],
                              ));
                            },
                            child: Card(child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset("assets/images/${controller.poetsImage[index]}"),
                            )),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
