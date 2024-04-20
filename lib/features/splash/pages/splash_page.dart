import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashPage extends  GetView<SplashController> {
  const SplashPage({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Container();
    // Image.asset("assets/images/splash.gif",
    // height: MediaQuery.of(context).size.height,
    //   width: MediaQuery.of(context).size.width,
    //   fit: BoxFit.fill,
    // );
  }
}
