import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okaz_souq/core/shared/styles/text_styles.dart';
import '../controllers/overview_controller.dart';

class OverviewPage extends GetView<OverviewController> {
  OverviewPage({Key? key}) : super(key: key);
  bool isPoemClicked = false;

  @override
  Widget build(BuildContext context) {
    Get.put(OverviewController());
    return Scaffold(
      backgroundColor: const Color(0xff231401),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  'Okaz Souq',
                  // style: TextStyles.title,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                //style: TextStyles.title,
              ),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              title: const Text(
                'About',
                //   style: TextStyles.title,
              ),
              onTap: () {
                Get.toNamed('/about');
              },
            ),
            ListTile(
              title: const Text(
                'Contact',
                //style: TextStyles.title,
              ),
              onTap: () {
                Get.toNamed('/contact');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown.shade500,
        centerTitle: true,
        title: Text(
          'سوق عكاظ',
          style: GoogleFonts.lemonada(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      // appBar: AppBar(
      //   // title: const Text("Overview",style: TextStyle(),),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 0.0, bottom: 0),
      //       child: Image.asset(
      //         "assets/images/vision.jfif",
      //       ),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/images/wallpaper.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),

                    //  Text(
                    //   "Images gallery",
                    //   style: MyTextStyles.hTwoTextStyle.copyWith(color:const Color(0xffEEDC82) ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                      ),
                      items: [
                        'assets/images/new_souq_okaz_images/The-Souk-Georg-Macco-Oil-Painting.jpg',
                        // 'assets/images/new_souq_okaz_images/201862421243599CH.jpg',
                        'assets/images/new_souq_okaz_images/1b54de6734528.jpg'
                        // "assets/images/image1.jfif",
                        // "assets/images/image2.jfif",
                        // "assets/images/image3.jfif",
                        // "assets/images/image5.jfif",
                        // "assets/images/image6.jfif"
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  i,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "سوق عكاظ، هو أهم أسواق العرب وأشهرها، يقع في شمال شرقي مدينة الطائف، وهو يحمل أهمية تاريخية حيث كان العرب يجتمعون فيه للبيع والشراء، ويستمعون إلى الشعراء والخطباء، وقد سجل التاريخ لسوق عكاظ دوراً أدبياً بارزاً في الجاهلية واستمر السوق إلى عام 129هـ",
                        // style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold),
                        style: GoogleFonts.mirza(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Text(
                      "الشعراء",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      // style: MyTextStyles.hTwoTextStyle,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              isPoemClicked = true;
                              // Get.dialog(AlertDialog(
                              //   title: Text(controller.poetsTitle[index]),
                              //   content: Text(
                              //     controller.poets[index],
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 16),
                              //   ),
                              //   actions: [
                              //     TextButton(
                              //         onPressed: () {
                              //           Clipboard.setData(ClipboardData(
                              //               text: controller.poets[index]));
                              //         },
                              //         child: Text("Copy")),
                              //     TextButton(
                              //         onPressed: () {
                              //           Get.back();
                              //         },
                              //         child: Text("Cancel"))
                              //   ],
                              // ));
                            },
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                  "assets/images/${controller.poetsImage[index]}"),
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
          Center(child: showPardyImage('poem'))
        ],
      ),
    );
  }

  Widget showPardyImage(String poem) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 400,
          width: 400,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/new_souq_okaz_images/paper.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Text(poem),
              Positioned(
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.cancel)))
            ],
          )),
    );
  }
}
