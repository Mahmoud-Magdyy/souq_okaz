import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theaters_controller.dart';

class TheatersPage extends GetView<TheatersController> {
  const TheatersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TheatersController());
    return Column(
      children: [
        SizedBox(height: 10,),
        Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset( "assets/images/shop.jfif", fit: BoxFit.cover),
            )),
        const SizedBox(height: 6,),
         Row (
          children: [
            Expanded(
              child: Card (
                color: Colors.deepPurpleAccent,
                child: SizedBox(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),

                            child: Image.asset("assets/images/let.jfif",height: 148,
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )
                        // Image.asset( "assets/images/exhibition.png",width: 90,height: 100,),
                        // const Text("معارض ثقافية",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/images/poet.jfif",height: 148,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )
                      // Image.asset( "assets/images/poem.png",width: 90,height: 100,),
                      // const Text("مسابقة الشعراء",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 6,),
        Card(
          color: Colors.redAccent,
          child: SizedBox(
            height: 183,
            width: MediaQuery.of(context).size.width,
            child:
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),

                child: Image.asset( "assets/images/horse.jpg",
                  fit: BoxFit.fitWidth,
                  height: 188,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            // Row (
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Image.asset( "assets/images/horse.jfif",
            //       // fit: BoxFit.fitWidth,
            //       width: MediaQuery.of(context).size.width-8,
            //     ),
            //     // const Text('عرض فنون الخيل',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
            //     // const SizedBox(width:40,),
            //     // Image.asset( "assets/images/horse.png", fit: BoxFit.cover),
            //   ],
            // ),
          ),
        )
      ],
    );
  }
}
