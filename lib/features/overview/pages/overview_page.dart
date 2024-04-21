import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okaz_souq/core/bloc/cubit/global_cubit.dart';
import 'package:okaz_souq/core/utils/app_strings.dart';
import 'package:okaz_souq/core/locale/app_loacl.dart';

import '../../../core/bloc/cubit/global_state.dart';

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
    AppStrings.amre2olkays,
    AppStrings.zuhairbinsalma,
    AppStrings.antaarebnshdad,
    AppStrings.amrBnOmKalsoom,
    AppStrings.labid,
    AppStrings.elHareth,
    AppStrings.tarfa,
  ];

  List<String> poets = [
    AppStrings.poetskayss,
    AppStrings.poetsZohayer,
    AppStrings.poets3antaar,
    AppStrings.poetskalthoom,
    AppStrings.poetsRabe3aa,
    AppStrings.poetsElHareeth,
    AppStrings.poetsEl3abd,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff231401),
          drawer: Drawer(
            child: ListView(
              children: [
                const SizedBox(height: 32),
                ListTile(
                  title: Text(AppStrings.language.trr(context)),
                  trailing: const Icon(Icons.language),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(AppStrings.selectLanguage.trr(context)),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(AppStrings.arabic.trr(context)),
                              onTap: () {
                                BlocProvider.of<GlobalCubit>(context)
                                    .changeLang('ar');
                                if (state is ChangeLangLoading) {
                                  setState(() {
                                    const Center(
                                        child:
                                            CircularProgressIndicator());
                                  });
                                }
                                if (state is ChangeLangSuccess) {
                                  setState(() {
                                    
                                    // Get.reset();
                                    Get.updateLocale(Locale(BlocProvider.of<GlobalCubit>(context).langCode));
                                    // Get.appUpdate();
                                  });
                                }
                                setState(() {});
                                // Implement logic to set app language to Arabic
                                Get.back();
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                BlocProvider.of<GlobalCubit>(context)
                                    .changeLang('en');
                                    if (state is ChangeLangSuccess) {
                                  setState(() {
                                    
                                    // Get.reset();
                                    Get.updateLocale(Locale(BlocProvider.of<GlobalCubit>(context).langCode));
                                    // Get.appUpdate();
                                  });
                                }

                                setState(() {});
                                // Implement logic to set app language to English
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(AppStrings.about.trr(context)),
                  trailing: const Icon(Icons.info_outline),
                  onTap: () {
                   
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(AppStrings.about.trr(context)),
                        content:  Text(AppStrings.aboutUsTitle.trr(context))
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.brown.shade500,
            centerTitle: true,
            title: Text(AppStrings.soqOkaz.trr(context),
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
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            AppStrings.okazTitle.trr(context),
                            style: GoogleFonts.amiri(
                                fontSize: 18, color: Colors.white),
                            // textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        Row(
                          children: [
                            // const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                AppStrings.poets.trr(context),
                                style: GoogleFonts.reemKufi(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                                // textAlign: TextAlign.right,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
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
      },
    );
  }

  Widget showPardyImage(String poem, String poetry) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimationLimiter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: ScaleAnimation(
                  child: widget,
                ),
              ),
              children: [
                Container(
                  height: BlocProvider.of<GlobalCubit>(context).langCode == "ar"
                      ? 250
                      : 350,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "assets/images/new_souq_okaz_images/paper.jpg"),
                        //   fit: BoxFit.fill,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Text(
                              // textDirection: TextDirection.rtl,
                              poetry.trr(context),
                              style: GoogleFonts.readexPro(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
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
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Text(
                            // textDirection: TextDirection.ltr,
                            poem.trr(context),
                            style: GoogleFonts.readexPro(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
