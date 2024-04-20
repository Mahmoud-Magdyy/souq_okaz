import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../controllers/shops_controller.dart';

class ShopsPage extends GetView<ShopsController> {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ShopsController());
    return SingleChildScrollView(
        child: AnimationLimiter(
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 400),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FlipAnimation(
              child: widget,
            ),
          ),
          children: [
            Image.asset("assets/images/shops.jpg"),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                          child: Image.asset(
                        "assets/images/shop1.jpg",
                        fit: BoxFit.contain,
                      )),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset("assets/images/shop2.png",
                            fit: BoxFit.contain),
                      ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Flexible(
                            child: Image.asset(
                          "assets/images/shop3.png",
                          fit: BoxFit.contain,
                        )),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset("assets/images/shop4.jpg",
                              fit: BoxFit.cover),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
