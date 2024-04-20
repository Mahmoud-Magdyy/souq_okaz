import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../controllers/theaters_controller.dart';

class TheatersPage extends GetView<TheatersController> {
  const TheatersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TheatersController());
    return AnimationLimiter(
        child: Column(
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 375),
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: 50.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child:
                    Image.asset("assets/images/shop.jfif", fit: BoxFit.cover),
              )),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.deepPurpleAccent,
                  child: SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: const FadeInImage(
                                        fit: BoxFit.fill,
                                        height: 148,
                                        width: double.infinity,
                                        placeholder: AssetImage(
                                            'assets/images/new_souq_okaz_images/2.png'),
                                        image: AssetImage(
                                            'assets/images/new_souq_okaz_images/2.png'))),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12)),
                                          color: Colors.black54,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 15),
                                        child: const Center(
                                            child: Text(
                                              'المعارض الثقافيه',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )))),
                              ],
                            )
                          )
                        ],
                      )),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.greenAccent,
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child:Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: const FadeInImage(
                                      fit: BoxFit.fill,
                                      height: 148,
                                      width: double.infinity,
                                      placeholder: AssetImage(
                                          'assets/images/new_souq_okaz_images/1.png'),
                                      image: AssetImage(
                                          'assets/images/new_souq_okaz_images/1.png'))),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        color: Colors.black54,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 15),
                                      child: const Center(
                                          child: Text(
                                            'مسابقة الشعراء',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )))),
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Card(
            color: Colors.redAccent,
            child: SizedBox(
              height: 183,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: const FadeInImage(
                              fit: BoxFit.fill,
                              height: 200,
                              width: double.infinity,
                              placeholder: AssetImage(
                                  'assets/images/new_souq_okaz_images/تصميم بدون عنوان (6).png'),
                              image: AssetImage(
                                  'assets/images/new_souq_okaz_images/تصميم بدون عنوان (6).png'))),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                                color: Colors.black54,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 44),
                              child: const Center(
                                  child: Text(
                                'عرض فنون الخيل',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )))),
                    ],
                  )

                  // Stack(
                  //   alignment: AlignmentDirectional.topCenter,
                  //   children: [
                  //     ClipRRect(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //       child: Image.asset(
                  //         "assets/images/new_souq_okaz_images/تصميم بدون عنوان (6).png",
                  //         fit: BoxFit.fitWidth,
                  //         height: 188,
                  //         width: MediaQuery.of(context).size.width,
                  //       ),
                  //     ),
                  //     Text('عرض فنون الخيل',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)
                  //   ],
                  // )
                  ),
            ),
          )
        ],
      ),
    ));
  }
}
