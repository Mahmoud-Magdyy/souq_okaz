// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/shared/models/user_model.dart';
// import '../../../core/shared/styles/my_colors.dart';
// import '../controllers/home_controller.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
//
// class HomePage extends  GetView<HomeController> {
//   final UserModel userModel;
//   const HomePage({super.key,required this.userModel});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController(userModel:userModel));
//     return Scaffold(
//       bottomNavigationBar: Container(
//       decoration: BoxDecoration(
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(
//           blurRadius: 20,
//           color: MyColors.primaryColor.withOpacity(.1),
//         )
//       ],
//     ),
//         child: SafeArea(
//         child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//     child: GNav(
//     rippleColor: Colors.grey[300]!,
//     hoverColor: Colors.grey[100]!,
//     gap: 8,
//     activeColor: MyColors.primaryColor,
//     iconSize: 24,
//     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//     duration: const Duration(milliseconds: 400),
//     tabBackgroundColor: Colors.grey[100]!,
//         onTabChange: (item){
//                 try {
//                   controller.selectedWidgetIndex.value = item;
//                   switch (item){
//                   }
//                 } catch(e){}
//               },
//     color: Colors.black,
//           tabs:const [
//             GButton(
//               icon: Icons.home,
//               text: 'Home',
//             ),
//             GButton(
//               icon: Icons.place,
//               text: 'Places',
//             ),
//             GButton(
//               icon: Icons.map,
//               text: 'Map',
//             ),
//           ]
//       )))),
//       body: Obx(()=>controller.homeWidgets[controller.selectedWidgetIndex.value]),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/shared/models/user_model.dart';
import '../../../core/shared/styles/my_colors.dart';
import '../controllers/home_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends GetView<HomeController> {
  final UserModel userModel;
  const HomePage({super.key,required this.userModel});


//comment
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController(userModel: userModel));
    return Scaffold(
      bottomNavigationBar: GNav(
          backgroundColor: Colors.brown,

          gap: 8,
          activeColor: Colors.white,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.brown.shade900,
          onTabChange: (item) {
            try {
              controller.selectedWidgetIndex.value = item;
              switch (item) {}
            } catch (e) {}
          },
          // color: Colors.black,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.place,
              text: 'Places',
            ),
            GButton(
              icon: Icons.map,
              text: 'Map',
            ),
          ]),
      body: Obx(
              () => controller.homeWidgets[controller.selectedWidgetIndex.value]),
    );
  }
}
