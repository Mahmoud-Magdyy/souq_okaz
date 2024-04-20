// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../controllers/overview_controller.dart';
//
// class OverviewPage extends GetView<OverviewController> {
//    OverviewPage({Key? key}) : super(key: key);
//    bool isPoemClicked = false;
//    List<String> poetsImage = [
//      "poets1.PNG",
//      "poets2.PNG",
//      "poets3.PNG",
//      "poets4.PNG",
//      "poets5.PNG",
//      "poets6.PNG",
//      "poets7.PNG",
//    ];
//    List<String> poetsTitle = [
//      "امرؤ القيس",
//      "زهير بن أبي سلمى",
//      "عنترة بن شداد",
//      "عمرو بن كلثوم",
//      "لبيد بن ربيعة",
//      "الحارث بن حلزة",
//      "طرفة بن العبد",
//    ];
//
//    List<String> poets = [
//      "قِفَا نَبْكِ مِنْ ذِكْرَى حَبِيْبٍ وَمَنْزِلِ بِسِقْطِ اللِّوَى بَيْنَ الدَّخُولِ فَحَوْمَل",
//      "أَمِن أُمِّ أَوفى دِمنَةٌ لَم تَكَلَّمِ بِحَومانَةِ الدُرّاجِ فَالمُتَثَلَّم",
//      "هَل غادَرَ الشُعَراءُ مِن مُتَرَدَّمِ أَم هَل عَرَفتَ الدارَ بَعدَ تَوَهُّم",
//      "أَلا هُبّي بِصَحنِكِ فَاَصبَحينا وَلا تُبقي خُمورَ الأَندَرينا",
//      "عَفَتِ الدِيارُ مَحَلُّها فَمُقامُها بِمَنىً تَأَبَّدَ غَولُها فَرِجامُها",
//      "آَذَنَتنا بِبَينِها أَسماءُ رُبَّ ثاوٍ يُمَلُّ مِنهُ الثَواءُ",
//      "لِخَولَةَ أَطلالٌ بِبُرقَةِ ثَهمَدِ تَلوحُ كَباقي الوَشمِ في ظاهِرِ اليَدِ",
//    ];
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(OverviewController());
//     return Scaffold(
//       backgroundColor: const Color(0xff231401),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             const DrawerHeader(
//               child: Center(
//                 child: Text(
//                   'Okaz Souq',
//                   // style: TextStyles.title,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: const Text(
//                 'Home',
//                 //style: TextStyles.title,
//               ),
//               onTap: () {
//                 Get.back();
//               },
//             ),
//             ListTile(
//               title: const Text(
//                 'About',
//                 //   style: TextStyles.title,
//               ),
//               onTap: () {
//                 Get.toNamed('/about');
//               },
//             ),
//             ListTile(
//               title: const Text(
//                 'Contact',
//                 //style: TextStyles.title,
//               ),
//               onTap: () {
//                 Get.toNamed('/contact');
//               },
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.brown.shade500,
//         centerTitle: true,
//         title: Text(
//           'سوق عكاظ',
//           style: GoogleFonts.lemonada(
//             fontSize: 18,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 14,
//                     ),
//
//
//                     CarouselSlider(
//                       options: CarouselOptions(
//                         height: 200.0,
//                         autoPlay: true,
//                       ),
//                       items: [
//                         'assets/images/new_souq_okaz_images/The-Souk-Georg-Macco-Oil-Painting.jpg',
//                         'assets/images/new_souq_okaz_images/1b54de6734528.jpg'
//
//                       ].map((i) {
//                         return Builder(
//                           builder: (BuildContext context) {
//                             return Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(16),
//                                 child: Image.asset(
//                                   i,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       }).toList(),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(5.0),
//                       child: Text(
//                         "سوق عكاظ، هو أهم أسواق العرب وأشهرها، يقع في شمال شرقي مدينة الطائف، وهو يحمل أهمية تاريخية حيث كان العرب يجتمعون فيه للبيع والشراء، ويستمعون إلى الشعراء والخطباء، وقد سجل التاريخ لسوق عكاظ دوراً أدبياً بارزاً في الجاهلية واستمر السوق إلى عام 129هـ",
//                         style: GoogleFonts.mirza(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.right,
//                       ),
//                     ),
//                     const Text(
//                       "الشعراء",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 200,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: 7,
//                         itemBuilder: (BuildContext context, int index) {
//                           return GestureDetector(
//                             onTap: () {
//                               isPoemClicked = true;
//
//                             },
//                             child: Card(
//                                 child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Image.asset(
//                                   "assets/images/${poetsImage[index]}"),
//                             )),
//                           );
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//          Center(child: showPardyImage('poem'))
//         ],
//       ),
//     );
//   }
//
//   Widget showPardyImage(String poem) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//           height: 400,
//           width: 400,
//           child: Stack(
//             alignment: AlignmentDirectional.center,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Image.asset(
//                   "assets/images/new_souq_okaz_images/paper.jpg",
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Text(poem),
//               Positioned(
//                   child: IconButton(onPressed: (){}, icon: const Icon(Icons.cancel)))
//             ],
//           )),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  bool isPoemClicked = false;
  String selectedPoem = '';
  String selectedPoetry = '';

  List<String> poetsImage = [
    "poets1.PNG",
    "poets2.PNG",
    "poets3.PNG",
    "poets4.PNG",
    "poets5.PNG",
    "poets6.PNG",
    "poets7.PNG",
  ];
  List<String> poetsTitle = [
    "امرؤ القيس",
    "زهير بن أبي سلمى",
    "عنترة بن شداد",
    "عمرو بن كلثوم",
    "لبيد بن ربيعة",
    "الحارث بن حلزة",
    "طرفة بن العبد",
  ];

  List<String> poets = [
    "قِفَا نَبْكِ مِنْ ذِكْرَى حَبِيْبٍ وَمَنْزِلِ بِسِقْطِ اللِّوَى بَيْنَ الدَّخُولِ فَحَوْمَل",
    "أَمِن أُمِّ أَوفى دِمنَةٌ لَم تَكَلَّمِ بِحَومانَةِ الدُرّاجِ فَالمُتَثَلَّم",
    "هَل غادَرَ الشُعَراءُ مِن مُتَرَدَّمِ أَم هَل عَرَفتَ الدارَ بَعدَ تَوَهُّم",
    "أَلا هُبّي بِصَحنِكِ فَاَصبَحينا وَلا تُبقي خُمورَ الأَندَرينا",
    "عَفَتِ الدِيارُ مَحَلُّها فَمُقامُها بِمَنىً تَأَبَّدَ غَولُها فَرِجامُها",
    "آَذَنَتنا بِبَينِها أَسماءُ رُبَّ ثاوٍ يُمَلُّ مِنهُ الثَواءُ",
    "لِخَولَةَ أَطلالٌ بِبُرقَةِ ثَهمَدِ تَلوحُ كَباقي الوَشمِ في ظاهِرِ اليَدِ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff231401),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(height:32),
            ListTile(
              title: const Text('Language'),
              trailing: const Icon(Icons.language),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              title: const Text('About'),
              trailing: const Icon(Icons.info_outline),

              onTap: () {
                Get.toNamed('/about');
              },
            ),
            ListTile(
              title: const Text('Contact'),
              trailing: const Icon(Icons.phone),
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
        title: Text('سوق عكاظ',
            style: GoogleFonts.reemKufi(
                fontSize: 22, fontWeight: FontWeight.w800)),
      ),
      body: Stack(
        children: [
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset('assets/images/vision.jfif'),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                      ),
                      items: [
                        'assets/images/new_souq_okaz_images/1b54de6734528.jpg',
                        'assets/images/new_souq_okaz_images/223141-13791133611.jpg',
                        'assets/images/new_souq_okaz_images/26477145205_5602ea9943_o.jpg',
                        'assets/images/new_souq_okaz_images/post-3d7de2c1-c1db-4bb2-b0e5-68f04ad0ac5c.jpg',
                        'assets/images/new_souq_okaz_images/من-اهم-الاسواق-في-شبة-الجزيرة-العربية-سوق-عكاظ (1).png'
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
                        style: GoogleFonts.amiri(
                            fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "الشعراء",
                            style: GoogleFonts.reemKufi(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isPoemClicked = true;
                                selectedPoem = poets[index];
                                selectedPoetry = poetsTitle[index];
                              });
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                  "assets/images/${poetsImage[index]}",
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isPoemClicked)
            Center(child: showPardyImage(selectedPoem, selectedPoetry)),
        ],
      ),
    );
  }

  Widget showPardyImage(String poem, String poetry) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/new_souq_okaz_images/paper.jpg"),
              //   fit: BoxFit.fill,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        isPoemClicked = false;
                      });
                    },
                    icon: const Icon(
                      Icons.cancel,
                      size: 32,
                    )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    textDirection: TextDirection.rtl,
                    poetry,
                    style: GoogleFonts.readexPro(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  textDirection: TextDirection.rtl,
                  poem,
                  style: GoogleFonts.readexPro(
                    fontSize: 22,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
