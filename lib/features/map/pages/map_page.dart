import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/map_controller.dart';

class MapPage extends GetView<MapController> {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MapController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Souq Map"),
      ),
      body: Stack(
        children: [
          Container(
            decoration:const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/wallpaper.jpg"), fit: BoxFit.cover,),
            ),
          ),
          SafeArea (
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/map.jpg"),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 40.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Padding(
                //         padding: EdgeInsets.only(left:8.0),
                //         child: Text("Participants Countries",style: MyTextStyles.hOneTextStyle,),
                //       ),
                //       const SizedBox(height: 10,),
                //       SizedBox(
                //         height: 120,
                //         child: ListView(
                //           scrollDirection: Axis.horizontal,
                //           children: [
                //             Image.asset("assets/images/Bahrain.svg",width: 160,height: 120,
                //             fit: BoxFit.fill,
                //             ),
                //             SizedBox(width: 10,),
                //             Image.asset("assets/images/syria.webp",width: 160,height: 120,  fit: BoxFit.fill,),
                //             SizedBox(width: 10,),
                //             Image.asset("assets/images/Lebanon.svg",width: 160,height: 120,  fit: BoxFit.fill,),
                //             SizedBox(width: 10,),
                //             Image.asset("assets/images/Qatar.svg",width: 160,height: 120,  fit: BoxFit.fill,),
                //             SizedBox(width: 10,),
                //             Image.asset("assets/images/kuwait.png",width: 160,height: 120,  fit: BoxFit.fill,),
                //             SizedBox(width: 10,),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
