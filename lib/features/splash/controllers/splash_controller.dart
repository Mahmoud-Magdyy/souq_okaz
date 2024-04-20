import 'package:get/get.dart';
import 'package:okaz_souq/features/login/pages/login_page.dart';

class SplashController extends GetxController {
  @override
  void onReady (){
    super.onReady();
    Get.off(()=> LoginPage());
    // Future.delayed(const Duration(seconds: 9),()=>Get.off(()=>const LoginPage()));
  }
}